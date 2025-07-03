#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from kwast_sorteerder.msg import KwastDetection
from kwast_sorteerder.msg import PickAndPlaceAction, PickAndPlaceGoal
import actionlib

class Hoofdprogramma(object):
    def __init__(self):
        rospy.init_node('hoofdprogramma_node')

        # Action Client
        self.client = actionlib.SimpleActionClient('/pick_and_place', PickAndPlaceAction)
        rospy.loginfo("Wachten op robot action server...")
        self.client.wait_for_server()
        rospy.loginfo("Verbonden met action server")

        # Vision topic subscriber
        rospy.Subscriber('/kwast_detectie', KwastDetection, self.detectie_callback)
        rospy.spin()

    def detectie_callback(self, msg):
        rospy.loginfo("Kwast gedetecteerd: %s", msg.kwast_type)

        goal = PickAndPlaceGoal()
        goal.target_pose = msg.pose
        goal.kwast_type = msg.kwast_type

        self.client.send_goal(goal, feedback_cb=self.feedback_cb)
        self.client.wait_for_result()

        result = self.client.get_result()
        if result.success:
            rospy.loginfo("Pick-and-place geslaagd!")
        else:
            rospy.logwarn("Pick-and-place mislukt!")

    def feedback_cb(self, feedback):
        rospy.loginfo("Feedback: %s", feedback.status)

if __name__ == '__main__':
    try:
        Hoofdprogramma()
    except rospy.ROSInterruptException:
        pass
