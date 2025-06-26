#!/usr/bin/env python

import rospy
import actionlib
import moveit_commander
from moveit_commander import MoveGroupCommander
from geometry_msgs.msg import Pose

from my_demo.msg import MoveToPoseAction, MoveToPoseGoal, MoveToPoseResult

class MoveItPlannerServer:
    def __init__(self):
        moveit_commander.roscpp_initialize([])  # Initialiseer MoveIt Commander

        self.server = actionlib.SimpleActionServer('moveit_planner', MoveToPoseAction, self.execute_cb, False)
        self.group = MoveGroupCommander("manipulator")
        self.server.start()
        rospy.loginfo("MoveItPlannerServer actief")

    def execute_cb(self, goal):
        rospy.loginfo("MoveIt doel ontvangen, plannen...")

        self.group.set_pose_target(goal.target_pose)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()

        if success:
            msg = "Planning en uitvoering gelukt"
        else:
            msg = "Planning mislukt"

        result = MoveToPoseResult(success=success, message=msg)
        self.server.set_succeeded(result)

if __name__ == '__main__':
    rospy.init_node('Moveit_Planner_Action_Server')
    MoveItPlannerServer()
    rospy.spin()
