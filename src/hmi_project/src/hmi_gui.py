#!/usr/bin/env python
import Tkinter as tk
import rospy
from std_msgs.msg import String
from commands import *
from state_machine import StateMachine

class HMIApp:
    def __init__(self, master):
        self.master = master
        self.master.title("ROS HMI")
        self.master.geometry("300x450")
        self.master.configure(bg="#dcdcdc")

        rospy.init_node('ros_hmi_node', anonymous=True)
        self.command_pub = rospy.Publisher('/hmi_commands', String, queue_size=10)
        rospy.Subscriber('/status_light', String, self.update_lights)

        self.state_machine = StateMachine()

        self.button_frame = tk.Frame(master, bg="#dcdcdc")
        self.button_frame.pack(pady=10)

        self.single_btn = tk.Button(self.button_frame, text="Single Start", width=12, command=lambda: self.send_command(SINGLE_START))
        self.single_btn.grid(row=0, column=0, padx=5, pady=5)

        self.cyclus_btn = tk.Button(self.button_frame, text="Cyclus Start", width=12, command=lambda: self.send_command(CYCLUS_START))
        self.cyclus_btn.grid(row=0, column=1, padx=5, pady=5)

        self.home_btn = tk.Button(self.button_frame, text="Home", width=26, command=lambda: self.send_command(HOME))
        self.home_btn.grid(row=1, column=0, columnspan=2, pady=5)

        self.stop_btn = tk.Button(self.button_frame, text="Stop", width=26, command=lambda: self.send_command(STOP))
        self.stop_btn.grid(row=2, column=0, columnspan=2, pady=5)

        self.reset_btn = tk.Button(self.button_frame, text="Reset", width=26, command=self.reset)
        self.reset_btn.grid(row=3, column=0, columnspan=2, pady=5)

        self.noodstop_btn = tk.Button(self.button_frame, text="Noodstop", width=26, bg="red", fg="white", command=lambda: self.send_command(NOODSTOP))
        self.noodstop_btn.grid(row=4, column=0, columnspan=2, pady=5)

        self.status_label = tk.Label(master, text="Statuslampjes:", font=("Arial", 12))
        self.status_label.pack(pady=10)

        self.green_light = tk.Label(master, text="Wacht op start", bg="gray", width=15, height=2)
        self.green_light.pack(pady=2)

        self.orange_light = tk.Label(master, text="In bedrijf", bg="gray", width=15, height=2)
        self.orange_light.pack(pady=2)

        self.red_light = tk.Label(master, text="Fout", bg="gray", width=15, height=2)
        self.red_light.pack(pady=2)

        self.blue_light = tk.Label(master, text="Homing", bg="gray", width=15, height=2)
        self.blue_light.pack(pady=2)

        self.update_buttons()
        self.master.after(100, self.ros_spin)

    def send_command(self, cmd):
        rospy.loginfo("Verzend commando: {}".format(cmd))
        self.command_pub.publish(String(cmd))
        self.state_machine.transition(cmd)
        self.update_buttons()

    def reset(self):
        rospy.loginfo("Reset naar standby")
        self.command_pub.publish(String(RESET))
        self.state_machine.transition(RESET)
        self.update_buttons()

    def update_buttons(self):
        state = self.state_machine.get_state()

        if state == "standby":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='normal')

        elif state in ["single_active", "cyclus_active"]:
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='normal')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='disabled')

        elif state == "vergrendeld":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='disabled')
            self.reset_btn.config(state='normal')
            self.home_btn.config(state='disabled')

        elif state == "home":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='normal')
            self.home_btn.config(state='normal')

    def update_lights(self, msg):
        status = msg.data.lower()
        self.set_all_lights("gray")
        if status == STATUS_WACHT_OP_START:
            self.green_light.config(bg="green")
        elif status == STATUS_IN_BEDRIJF:
            self.orange_light.config(bg="orange")
        elif status == STATUS_STORING:
            self.green_light.config(bg="green")
            self.orange_light.config(bg="orange")
        elif status == STATUS_FOUT:
            self.red_light.config(bg="red")
        elif status == STATUS_HOMING:
            self.blue_light.config(bg="blue")
        else:
            rospy.logwarn("Onbekende status ontvangen: {}".format(status))

    def set_all_lights(self, color):
        self.green_light.config(bg=color)
        self.orange_light.config(bg=color)
        self.red_light.config(bg=color)
        self.blue_light.config(bg=color)

    def ros_spin(self):
        if not rospy.is_shutdown():
            rospy.spin_once()
            self.master.after(100, self.ros_spin)

def spin_once():
    import select
    r, _, _ = select.select([rospy.core._poller], [], [], 0.01)
    if r:
        rospy.rostime.wallsleep(0.01)

rospy.spin_once = spin_once

if __name__ == '__main__':
    root = tk.Tk()
    app = HMIApp(root)
    root.mainloop()

