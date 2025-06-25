#!/usr/bin/env python
import rospy
import sys
import math
import moveit_commander
import moveit_msgs.msg
from geometry_msgs.msg import Pose
from tf.transformations import quaternion_from_euler

# Initialiseer alles voor MoveIt
rospy.init_node('robot_beweging', anonymous=True)
moveit_commander.roscpp_initialize(sys.argv)
robot = moveit_commander.RobotCommander()
scene = moveit_commander.PlanningSceneInterface()
group = moveit_commander.MoveGroupCommander('arm')
display_trajectory_publisher = rospy.Publisher(
    '/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=20)

def go_named(name):
    print("== Ga naar {} ==".format(name))
    group.set_named_target(name)
    group.go(wait=True)
    group.stop()
    group.clear_pose_targets()

def go_pose(x, y, z):
    pose = Pose()
    pose.position.x = x
    pose.position.y = y
    pose.position.z = z
    quat = quaternion_from_euler(math.pi, 0, 0)  # draaiing over X-as
    pose.orientation.x = quat[0]
    pose.orientation.y = quat[1]
    pose.orientation.z = quat[2]
    pose.orientation.w = quat[3]
    print("== Ga naar pose: x={}, y={}, z={} ==".format(x, y, z))
    group.set_pose_target(pose)
    group.go(wait=True)
    group.stop()
    group.clear_pose_targets()

