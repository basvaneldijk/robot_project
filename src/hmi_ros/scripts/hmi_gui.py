#! /usr/bin/env python

import Tkinter as tk
import rospy
from std_msgs.msg import String

class HMIApp:
    def __init__(self, master):
        self.master = master
        self.master.title("ROS HMI")
        self.master.geometry("300x450")
        self.master.configure(bg="#dcdcdc")

        # ROS Node en Publisher
        rospy.init_node('ros_hmi_node', anonymous=True)
        self.command_pub = rospy.Publisher('/hmi_commands', String, queue_size=10)
        rospy.Subscriber('/status_light', String, self.update_lights)

        # Interne status
        self.state = "startup"  # eerste keer opstarten in 'startup'

        # Frame voor knoppen
        self.button_frame = tk.Frame(master, bg="#dcdcdc")
        self.button_frame.pack(pady=10)

        self.single_btn = tk.Button(self.button_frame, text="Single Start", width=12, command=lambda: self.send_command("single_start"))
        self.single_btn.grid(row=0, column=0, padx=5, pady=5)

        self.cyclus_btn = tk.Button(self.button_frame, text="Cyclus Start", width=12, command=lambda: self.send_command("start_cyclus"))
        self.cyclus_btn.grid(row=0, column=1, padx=5, pady=5)

        self.home_btn = tk.Button(self.button_frame, text="Home", width=26, command=self.home_procedure)
        self.home_btn.grid(row=1, column=0, columnspan=2, pady=5)

        self.stop_btn = tk.Button(self.button_frame, text="Stop", width=26, command=lambda: self.send_command("stop"))
        self.stop_btn.grid(row=2, column=0, columnspan=2, pady=5)

        self.reset_btn = tk.Button(self.button_frame, text="Reset", width=26, command=self.reset)
        self.reset_btn.grid(row=3, column=0, columnspan=2, pady=5)

        self.noodstop_btn = tk.Button(self.button_frame, text="Noodstop", width=26, bg="red", fg="white", command=lambda: self.send_command("noodstop"))
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
        self.set_all_lights("gray")

        self.master.after(100, self.ros_spin)

    def send_command(self, cmd):
        rospy.loginfo("Verzend commando: {}".format(cmd))
        self.command_pub.publish(String(cmd))

        if cmd == "single_start":
            self.state = "single_active"
            self.set_all_lights("gray")
            self.orange_light.config(bg="orange")
        elif cmd == "start_cyclus":
            self.state = "cyclus_active"
            self.set_all_lights("gray")
            self.orange_light.config(bg="orange")
        elif cmd == "stop" or cmd == "noodstop":
            self.state = "vergrendeld"
            self.set_all_lights("gray")

        self.update_buttons()

    def home_procedure(self):
        rospy.loginfo("Start homing...")
        self.command_pub.publish(String("home"))
        self.state = "home"
        self.set_all_lights("gray")
        self.blue_light.config(bg="blue")

        # Wacht even, dan direct naar standby
        self.master.after(2000, self.enter_standby)

        self.update_buttons()

    def enter_standby(self):
        rospy.loginfo("Homing voltooid, ga naar standby.")
        self.state = "standby"
        self.set_all_lights("gray")
        self.green_light.config(bg="green")
        self.update_buttons()

    def reset(self):
        rospy.loginfo("Reset naar standby")
        self.command_pub.publish(String("reset"))
        self.state = "standby"
        self.set_all_lights("gray")
        self.green_light.config(bg="green")
        self.update_buttons()

    def update_buttons(self):
        if self.state == "startup":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='normal')

        elif self.state == "standby":
            self.single_btn.config(state='normal')
            self.cyclus_btn.config(state='normal')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='disabled')  # niet meer nodig

        elif self.state in ["single_active", "cyclus_active"]:
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='normal')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='disabled')

        elif self.state == "vergrendeld":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='disabled')
            self.reset_btn.config(state='normal')
            self.home_btn.config(state='disabled')

        elif self.state == "home":
            self.single_btn.config(state='disabled')
            self.cyclus_btn.config(state='disabled')
            self.stop_btn.config(state='disabled')
            self.noodstop_btn.config(state='normal')
            self.reset_btn.config(state='disabled')
            self.home_btn.config(state='disabled')

    def update_lights(self, msg):
        status = msg.data.lower()
        self.set_all_lights("gray")
        if status == "wacht_op_start":
            self.green_light.config(bg="green")
        elif status == "in_bedrijf":
            self.orange_light.config(bg="orange")
        elif status == "storing":
            self.green_light.config(bg="green")
            self.orange_light.config(bg="orange")
        elif status == "fout":
            self.red_light.config(bg="red")
        elif status == "homing":
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

# Monkey-patch voor rospy.spin_once()
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