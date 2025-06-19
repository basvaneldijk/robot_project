#!/usr/bin/env python

import sys
import rospy
import moveit_commander
import geometry_msgs.msg
from tf.transformations import quaternion_from_euler

def move_to_pose(x, y, z, roll, pitch, yaw):
    # Initialiseer moveit
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_ufactory_node', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()

    group_name = "lite6"  # <-- pas aan als jouw MoveIt groep anders heet
    move_group = moveit_commander.MoveGroupCommander(arm)

    # Zet doelpositie
    pose_target = geometry_msgs.msg.Pose()
    pose_target.position.x = x
    pose_target.position.y = y
    pose_target.position.z = z

    # Zet orientatie met RPY Quaternion
    q = quaternion_from_euler(roll, pitch, yaw)
    pose_target.orientation.x = q[0]
    pose_target.orientation.y = q[1]
    pose_target.orientation.z = q[2]
    pose_target.orientation.w = q[3]

    move_group.set_pose_target(pose_target)

    # Plannen en uitvoeren
    plan = move_group.go(wait=True)
    move_group.stop()
    move_group.clear_pose_targets()

    rospy.sleep(1)
    moveit_commander.roscpp_shutdown()

if __name__ == '__main__':
    # Voorbeeldcoordinaten: x, y, z, roll, pitch, yaw
    move_to_pose(0.3, 0.0, 0.2, 0, 0, 0)
