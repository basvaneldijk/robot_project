#!/usr/bin/env python2
import rospy
import serial
from std_msgs.msg import String

class CarouselController:
    def __init__(self):
        rospy.init_node('carousel_node')
        rospy.loginfo("Start carousel node...")

        # Verbind met Arduino
        try:
            self.serial = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
            rospy.sleep(2)
            rospy.loginfo("Verbinding met Arduino via /dev/ttyACM0 succesvol.")
        except serial.SerialException as e:
            rospy.logerr("Fout bij openen van seriele poort: {}".format(e))
            exit(1)

        # Subscriber voor commando's
        rospy.Subscriber('/carousel_command', String, self.command_callback)

        # Publisher voor status (optioneel)
        self.status_pub = rospy.Publisher('/carousel_status', String, queue_size=10)

        self.rate = rospy.Rate(10)

    def command_callback(self, msg):
        cmd = msg.data.strip().lower()
        rospy.loginfo("Ontvangen commando: {}".format(cmd))
        try:
            # Python 2: encode naar bytes-string voor serial write
            self.serial.write(cmd + "\n")
        except Exception as e:
            rospy.logerr("Fout bij schrijven naar Arduino: {}".format(e))

    def read_status(self):
        try:
            line = self.serial.readline()
            if line:
                # serial.readline() geeft bytes, decode naar unicode string (utf-8)
                line_str = line.strip()
                if isinstance(line_str, bytes):
                    line_str = line_str.decode('utf-8')
                self.status_pub.publish(line_str)
                rospy.loginfo("Status van Arduino: {}".format(line_str))
        except Exception as e:
            rospy.logwarn("Fout bij lezen van Arduino: {}".format(e))

    def run(self):
        while not rospy.is_shutdown():
            self.read_status()
            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = CarouselController()
        node.run()
    except rospy.ROSInterruptException:
        pass