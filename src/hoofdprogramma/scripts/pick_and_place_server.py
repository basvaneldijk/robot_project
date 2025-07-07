#!/usr/bin/env python
import rospy
import actionlib
from geometry_msgs.msg import Pose
from hoofdprogramma.msg import PickAndPlaceAction, PickAndPlaceResult, PickAndPlaceFeedback
from robot_controller_node import RobotController

class PickAndPlaceServer(object):
    def __init__(self):
        rospy.init_node('pick_and_place_server')

        self.server = actionlib.SimpleActionServer('/pick_and_place', PickAndPlaceAction,
        execute_cb=self.execute_cb, auto_start=False)
        self.server.start()
        self.robot = RobotController()
        rospy.loginfo("PickAndPlace action server actief.")

    def execute_cb(self, goal):
        feedback = PickAndPlaceFeedback()
        result = PickAndPlaceResult()

        rospy.loginfo("Nieuw goal ontvangen: %s", goal.kwast_type)
        feedback.status = "Bewegen naar home..."
        self.server.publish_feedback(feedback)
        self.robot.move_to_named_target("home")
        self.robot.gripper_on()

        feedback.status = "Start pick"
        self.server.publish_feedback(feedback)

        if not self.robot.pick(goal.target_pose):
            result.success = False
            self.server.set_aborted(result, "Pick mislukt")
            return

        mapping = {
            "dun": "BakRB",
            "dik": "BakRO",
            "kwast": "BakLB",
            "pen": "BakLO"
        }
        doel = mapping.get(goal.kwast_type.lower(), "home")

        feedback.status = "Bewegen naar %s" % doel
        self.server.publish_feedback(feedback)
        self.robot.move_to_named_target(doel)
        self.robot.gripper_on()

        feedback.status = "Terug naar home"
        self.server.publish_feedback(feedback)
        self.robot.move_to_named_target("home")
        self.robot.gripper_off()

        result.success = True
        self.server.set_succeeded(result, "Pick-and-place geslaagd")

if __name__ == '__main__':
    PickAndPlaceServer()
