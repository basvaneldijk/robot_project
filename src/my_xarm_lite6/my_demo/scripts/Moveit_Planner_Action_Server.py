#!/usr/bin/env python
import rospy
import actionlib
from ufactory_motion.msg import Move_To_Pose, MoveToPoseResult
from moveit_commander import MoveGroupCommander, RobotCommander, PlanningSceneInterface
from geometry_msgs.msg import Pose

class MoveItPlannerServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('moveit_planner', Move_To_Pose, self.execute_cb, False)
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

        self.server.set_succeeded(MoveToPoseResult(success=success, message=msg))

if __name__ == '__main__':
    rospy.init_node('Moveit_Planner_Action_Server')
    MoveItPlannerServer()
    rospy.spin()

