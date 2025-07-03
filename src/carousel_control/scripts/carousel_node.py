#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import serial
from std_msgs.msg import String

class CarouselController:
    def __init__(self):
        rospy.init_node('carousel_node')
        rospy.loginfo("Start carousel node...")

        try:
            self.serial = serial.Serial('/dev/ttyACM0', 115200, timeout=1)
            rospy.sleep(2)
            self.serial.flushInput()
            self.serial.flushOutput()
            rospy.loginfo("Connected to Arduino on /dev/ttyACM0")
        except serial.SerialException as e:
            rospy.logerr("Error opening serial port: {}".format(e))
            exit(1)

        rospy.Subscriber('/carousel_command', String, self.command_callback)
        self.status_pub = rospy.Publisher('/carousel_status', String, queue_size=10)
        self.rate = rospy.Rate(10)

    def command_callback(self, msg):
        cmd = msg.data.strip().lower()
        rospy.loginfo("Received command: '{}'".format(cmd))
        try:
            self.serial.flushOutput()
            bytes_written = self.serial.write((cmd + "\n").encode('utf-8'))
            self.serial.flush()
            rospy.loginfo("Sent command: '{}', bytes_written: {}".format(cmd, bytes_written))
        except Exception as e:
            rospy.logerr("Error writing to Arduino: {}".format(e))

    def read_status(self):
        try:
            line = self.serial.readline()
            if line:
                try:
                    decoded = line.strip().decode('utf-8')
                    self.status_pub.publish(String(decoded))
                    rospy.loginfo("Status from Arduino: {}".format(decoded))
                except Exception as decode_error:
                    rospy.logwarn("Decode error: {}".format(decode_error))
        except Exception as e:
            rospy.logwarn("Read error: {}".format(e))

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