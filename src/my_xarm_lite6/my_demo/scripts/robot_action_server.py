#!/usr/bin/env python
import rospy
import moveit_commander
import actionlib
import subprocess
from geometry_msgs.msg import Pose
from my_xarm_lite6.msg import BrushPoseAction, BrushPoseResult

class RobotActionServer:
    def __init__(self):
        rospy.init_node('robot_action_server')
        moveit_commander.roscpp_initialize([])
        self.group = moveit_commander.MoveGroupCommander("xarm6")

        self.server = actionlib.SimpleActionServer(
            'move_brush',
            BrushPoseAction,
            execute_cb=self.execute_cb,
            auto_start=False
        )
        self.server.start()
        rospy.loginfo("Robot Action Server gestart.")

    def gripper_on(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '1'])

    def gripper_off(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '0'])

    def execute_cb(self, goal):
        pose = goal.target_pose
        rospy.loginfo("Doel ontvangen, beweeg naar: %s", pose)

        self.group.set_pose_target(pose)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()

        result = BrushPoseResult()

        if success:
            rospy.loginfo("Beweging succesvol.")
            self.gripper_on()
            rospy.sleep(1.0)
            self.gripper_off()
            result.success = True
            result.status = "Kwast opgepakt"
        else:
            rospy.logwarn("Beweging mislukt.")
            result.success = False
            result.status = "Mislukt"

        self.server.set_succeeded(result)

if __name__ == '__main__':
    RobotActionServer()
    rospy.spin()
