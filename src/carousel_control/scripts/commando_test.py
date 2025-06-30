#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def send_command(cmd):
    pub = rospy.Publisher('/carousel_commands', String, queue_size=10)
    rospy.init_node('carousel_command_sender', anonymous=True)
    rospy.sleep(1)  # Even wachten tot publisher klaar is
    rospy.loginfo(f"Verstuur commando: {cmd}")
    pub.publish(cmd)

if __name__ == '__main__':
    try:
        while not rospy.is_shutdown():
            cmd = input("Typ commando (home, single start, auto start, stop, noodstop, quit): ").strip()
            if cmd == "quit":
                break
            if cmd in ["home", "single start", "auto start", "stop", "noodstop"]:
                send_command(cmd)
            else:
                print("Ongeldig commando. Probeer opnieuw.")
    except rospy.ROSInterruptException:
        pass
