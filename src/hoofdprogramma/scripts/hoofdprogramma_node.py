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

        self.carousel_pub = rospy.Publisher('/carousel_command', String, queue_size=10)
        self.status_pub = rospy.Publisher('/status_light', String, queue_size=10)

        rospy.Subscriber('/carousel_status', String, self.carousel_status_cb)
        rospy.Subscriber('/kwast_detectie', KwastDetection, self.kwast_detectie_cb)
        rospy.Subscriber('/hmi_commands', String, self.hmi_command_cb)

        self.pick_client = actionlib.SimpleActionClient('/pick_and_place', PickAndPlaceAction)
        rospy.loginfo("Wachten op robot action server...")
        self.pick_client.wait_for_server()
        rospy.loginfo("Verbonden met robot action server")

        self.homing_done = False
        self.kwast_ontvangen = False
        self.kwast_pose = None
        self.kwast_type = ""
        self.mode = None  # 'single', 'cyclus'

        self.loop()

    def hmi_command_cb(self, msg):
        rospy.loginfo("Ontvangen HMI-commando: %s", msg.data)

        if msg.data == "home":
            self.carousel_pub.publish("home")
            self.mode = None

        elif msg.data == "single_start":
            self.mode = "single"

        elif msg.data == "start_cyclus":
            self.mode = "cyclus"

        elif msg.data == "reset":
            self.mode = None
            self.kwast_ontvangen = False
            self.homing_done = False

    def carousel_status_cb(self, msg):
        if msg.data.strip().lower() == ">> homing klaar.":
            rospy.loginfo("Homing is voltooid.")
            self.homing_done = True
        elif msg.data.strip().lower() == "cyclus_done":
            rospy.loginfo("Carrouselpositie bereikt. Wacht op kwastdetectie...")

    def kwast_detectie_cb(self, msg):
        rospy.loginfo("Kwast gedetecteerd: %s", msg.kwast_type)
    
        # Opslaan van data
        self.kwast_pose = msg.pose
        self.kwast_type = msg.kwast_type
    
     # Start direct pick-and-place
        rospy.loginfo("Start pick-and-place automatisch")
        goal = PickAndPlaceGoal()
        goal.target_pose = self.kwast_pose
        goal.kwast_type = self.kwast_type

        self.pick_client.send_goal(goal)
        self.pick_client.wait_for_result()

        result = self.pick_client.get_result()
        if result and result.success:
            rospy.loginfo("Pick-and-place geslaagd.")
            self.status_pub.publish("geslaagd")
        else:
            rospy.logwarn("Pick-and-place mislukt.")
            self.status_pub.publish("mislukt")

    def start_pick_and_place(self):
        rospy.loginfo("Start pick-and-place...")

        goal = PickAndPlaceGoal()
        goal.target_pose = self.kwast_pose
        goal.kwast_type = self.kwast_type

        self.pick_client.send_goal(goal)
        self.pick_client.wait_for_result()
        result = self.pick_client.get_result()

        if result and result.success:
            rospy.loginfo("✅ Pick-and-place geslaagd.")
            self.status_pub.publish("geslaagd")
        else:
            rospy.logwarn("❌ Pick-and-place mislukt.")
            self.status_pub.publish("mislukt")

    def loop(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            if self.mode in ["single", "cyclus"]:
                if not self.homing_done:
                    rospy.loginfo("Homing uitvoeren...")
                    self.carousel_pub.publish("home")
                    rospy.sleep(1.0)
                    continue

                rospy.loginfo("Start carrouselpositie...")
                self.carousel_pub.publish("single_start")

                # Wacht op kwast
                timeout = rospy.Time.now() + rospy.Duration(10.0)
                self.kwast_ontvangen = False
                while not self.kwast_ontvangen and rospy.Time.now() < timeout:
                    rospy.sleep(0.1)

                if not self.kwast_ontvangen:
                    rospy.logwarn("Geen kwast gedetecteerd binnen timeout.")
                    self.status_pub.publish("kwast_niet_gevonden")
                    self.mode = None if self.mode == "single" else self.mode
                    continue

                self.start_pick_and_place()
                self.status_pub.publish("cyclus_voltooid")
                self.kwast_ontvangen = False

                if self.mode == "single":
                    self.mode = None

            rate.sleep()

if __name__ == '__main__':
    try:
        Hoofdprogramma()
    except rospy.ROSInterruptException:
        pass
