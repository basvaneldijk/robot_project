#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from hoofdprogramma.msg import KwastDetection
from hoofdprogramma.msg import PickAndPlaceAction, PickAndPlaceGoal
import actionlib

class Hoofdprogramma(object):
    def __init__(self):
        rospy.init_node('hoofdprogramma_node')

        # Publishers
        self.carousel_pub = rospy.Publisher('/carousel_command', String, queue_size=10)
        self.status_pub = rospy.Publisher('/status_light', String, queue_size=10)

        # Subscribers
        rospy.Subscriber('/carousel_status', String, self.carousel_status_cb)
        rospy.Subscriber('/kwast_detectie', KwastDetection, self.kwast_detectie_cb)
        rospy.Subscriber('/hmi_commands', String, self.hmi_command_cb)

        # Action client voor pick-and-place
        self.pick_client = actionlib.SimpleActionClient('/pick_and_place', PickAndPlaceAction)
        rospy.loginfo("Wachten op robot action server...")
        self.pick_client.wait_for_server()
        rospy.loginfo("Verbonden met robot action server")

        # Interne flags
        self.start_cyclus = False
        self.kwast_ontvangen = False
        self.kwast_pose = None
        self.kwast_type = ""

        rospy.spin()

    def hmi_command_cb(self, msg):
        rospy.loginfo("Ontvangen HMI-commando: %s", msg.data)

        if msg.data == "home":
            rospy.loginfo("Home-commando ontvangen. Carousel gaat naar home.")
            self.carousel_pub.publish("home")
            self.status_pub.publish("home")

        elif msg.data == "single_start":
            self.start_cyclus = True
            self.status_pub.publish("cyclus_start")
            self.start_cyclusflow()

    def carousel_status_cb(self, msg):
        if msg.data == "cyclus_done":
            rospy.loginfo("Carrouselpositie bereikt. Wacht op kwastdetectie...")

    def kwast_detectie_cb(self, msg):
        rospy.loginfo("Kwast gedetecteerd: %s", msg.kwast_type)
        self.kwast_pose = msg.pose
        self.kwast_type = msg.kwast_type
        self.kwast_ontvangen = True

    def start_cyclusflow(self):
        # 0. Carousel naar home
        rospy.loginfo("Stuur carousel naar home...")
        self.carousel_pub.publish("home")

        # 1. Carrousel start
        rospy.loginfo("Start carrousel...")
        self.carousel_pub.publish("single_start")

        # 2. Wacht op kwastdetectie
        timeout = rospy.Time.now() + rospy.Duration(10.0)
        while not self.kwast_ontvangen and rospy.Time.now() < timeout:
            rospy.sleep(0.1)

        if not self.kwast_ontvangen:
            rospy.logwarn("Geen kwast gedetecteerd binnen timeout.")
            self.status_pub.publish("kwast_niet_gevonden")
            return

        # 3. Start pick-and-place
        goal = PickAndPlaceGoal()
        goal.target_pose = self.kwast_pose
        goal.kwast_type = self.kwast_type

        rospy.loginfo("Start pick-and-place...")
        self.pick_client.send_goal(goal)
        self.pick_client.wait_for_result()

        result = self.pick_client.get_result()
        if result and result.success:
            rospy.loginfo("Pick-and-place geslaagd.")
            self.status_pub.publish("geslaagd")
        else:
            rospy.logwarn("Pick-and-place mislukt.")
            self.status_pub.publish("mislukt")

        # 4. Reset flags en terug naar home
        self.kwast_ontvangen = False
        self.start_cyclus = False

        # 5. Meld cyclus voltooid
        self.status_pub.publish("cyclus_voltooid")
        rospy.loginfo("Cyclus afgerond.")

if __name__ == '__main__':
    try:
        Hoofdprogramma()
    except rospy.ROSInterruptException:
        pass
