#!/usr/bin/env python
import rospy
from std_msgs.msg import String, Bool, Empty

class MainController:
    def __init__(self):
        rospy.init_node('main_controller')

        # interne toestand
        self.mode = None
        self.kwast_detected = False
        self.cyclus_mode = False
        self.carousel_ready = False
        self.object_ready = False

        # Subscribers
        rospy.Subscriber('/hmi_commands', String, self.hmi_callback)
        rospy.Subscriber('/kwast_detected', Bool, self.kwast_callback)
        rospy.Subscriber('/kwast_type', String, self.type_callback)
        rospy.Subscriber('/carousel_status', String, self.carousel_ready_callback)

        # Publishers
        self.start_detectie_pub = rospy.Publisher('/start_detectie', Empty, queue_size=1)
        self.robot_pub = rospy.Publisher('/move_to_bin', String, queue_size=1)
        self.carousel_pub = rospy.Publisher('/carousel_command', String, queue_size=1)

        rospy.loginfo("Main controller actief")
        self.loop()

    def hmi_callback(self, msg):
        cmd = msg.data.lower()  # altijd lowercase maken

        if cmd == "single_start":
            self.mode = "run"
            self.cyclus_mode = False
            self.carousel_pub.publish("single_start")
        elif cmd == "start_cyclus":
            self.mode = "run"
            self.cyclus_mode = True
            self.carousel_pub.publish("auto_start")
        elif cmd == "stop":
            self.mode = "stop"
            self.carousel_pub.publish("stop")
        elif cmd == "noodstop":
            self.mode = "noodstop"
            self.carousel_pub.publish("noodstop")
        elif cmd == "reset":
            self.mode = None
            self.tafel_ready = False
            self.kwast_detected = False
            self.carousel_ready = False
            self.object_ready = False
            self.carousel_pub.publish("home")
        elif cmd == "home":
            self.mode = "home"
            self.carousel_pub.publish("home")

    def carousel_ready_callback(self, msg):
        if msg.data.strip().lower() == "carousel_ready":
            self.carousel_ready = True
            rospy.loginfo("MainController: Carrousel is klaar.")
        else:
            self.carousel_ready = False

    def kwast_callback(self, msg):
        self.kwast_detected = msg.data

    def type_callback(self, msg):
        if self.mode in ["run"]:
            kwast_type = msg.data
            rospy.loginfo("Kwast gedetecteerd: " + kwast_type)

            # bepaal juiste bak
            bak_mapping = {
                "dik": "bak1",
                "dun": "bak2",
                "penseel": "bak3",
                "rubber": "bak4"
            }
            bak = bak_mapping.get(kwast_type, "bak_onbekend")
            self.robot_pub.publish(bak)
            rospy.loginfo("Stuur robot naar: " + bak)

            if self.cyclus_mode:
                # wacht even en begin opnieuw
                rospy.sleep(2)
                self.mode = "run"
            else:
                self.mode = None  # klaar met single run

    def loop(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            if self.mode == "run":
                if self.object_ready and self.kwast_detected:
                    rospy.loginfo("Start detectie...")
                    self.start_detectie_pub.publish(Empty())
                    self.mode = "wacht_detectie"
            elif self.mode == "stop":
                rospy.loginfo("Stop na huidige ronde.")
                self.mode = None
            elif self.mode == "noodstop":
                rospy.logwarn("!!! Noodstop geactiveerd !!!")
                break  # verlaat programma of stuur stop naar alle nodes
            rate.sleep()

if __name__ == '__main__':
    try:
        MainController()
    except rospy.ROSInterruptException:
        pass

