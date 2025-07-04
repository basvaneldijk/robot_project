#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import serial
from std_msgs.msg import String

class CarouselController:
    def __init__(self):
        rospy.init_node('carousel_node')
        rospy.loginfo("Start carousel node...")
        
        self.state = 0  #  Voeg dit toe om het probleem op te lossen!

        self.cmd_sub = rospy.Subscriber("/carousel_command", String, self.command_callback)
        self.status_pub = rospy.Publisher("/carousel_status", String, queue_size=10)

        try:
            self.arduino = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
            rospy.sleep(2)
            self.arduino.flushInput()
            self.arduino.flushOutput()
            rospy.loginfo("Connected to Arduino on /dev/ttyACM0")
        except serial.SerialException as e:
            rospy.logerr("Error opening serial port: {}".format(e))
            exit(1)

        self.status_pub = rospy.Publisher('/carousel_status', String, queue_size=10)
        self.rate = rospy.Rate(10)

    def command_callback(self, msg):
        command = msg.data.encode('utf-8').decode('ascii', errors='ignore').strip()
        rospy.loginfo("Received command: %s", command)
        rospy.loginfo("Command ASCII: %s", [ord(c) for c in command])  # Debug

        if command == "home":
            self.arduino.write(b'home\n')
            rospy.loginfo("Sent command: home")
            self.state = 1

        elif command == "single_start":
            if self.state == 0:
                self.arduino.write(b'single_start\n')
                rospy.loginfo("Sent command: single_start")
                self.state = 1
            else:
                rospy.logwarn("Ignored single_start: motor is busy (state = %d)", self.state)

        elif command == "auto_run":
            if self.state == 0:
                self.arduino.write(b'auto_run\n')
                rospy.loginfo("Sent command: auto_run")
                self.state = 1
            else:
                rospy.logwarn("Ignored auto_run: motor is busy (state = %d)", self.state)

        else:
            rospy.logwarn("Unknown command: %s", command)

    def read_status(self):
        try:
            line = self.arduino.readline()
            if line:
                try:
                    decoded = line.strip().decode('utf-8')
                    self.status_pub.publish(String(decoded))
                    rospy.loginfo("Status from Arduino: {}".format(decoded))

                    # Zet state op 0 als cyclus klaar is of homing klaar is
                    if "cycle_done" in decoded:
                        rospy.loginfo("Cyclus afgerond, terug naar standby.")
                        self.state = 0

                    elif "homing klaar" in decoded:
                        rospy.loginfo("Homing afgerond, terug naar standby.")
                        self.state = 0

                except Exception as decode_error:
                    rospy.logwarn("Decode error: {}".format(decode_error))
        except Exception as e:
            rospy.logwarn("Read error: {}".format(e))

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