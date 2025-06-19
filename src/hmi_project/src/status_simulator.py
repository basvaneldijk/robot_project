#!/usr/bin/env python
import rospy
from std_msgs.msg import String

class StatusResponder:
    def __init__(self):
        rospy.init_node('status_responder', anonymous=True)
        self.pub = rospy.Publisher('/status_light', String, queue_size=10)
        rospy.Subscriber('/hmi_commands', String, self.command_callback)
        rospy.spin()

    def command_callback(self, msg):
        cmd = msg.data
        rospy.loginfo("Ontvangen commando: %s", cmd)
        if cmd == "single_start":
            self.pub.publish("in_bedrijf")
        elif cmd == "cyclus_start":
            self.pub.publish("in_bedrijf")
        elif cmd == "stop":
            self.pub.publish("storing")
        elif cmd == "noodstop":
            self.pub.publish("fout")
        elif cmd == "home":
            self.pub.publish("homing")

if __name__ == '__main__':
    try:
        StatusResponder()
    except rospy.ROSInterruptException:
        pass
