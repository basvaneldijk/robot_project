#!/usr/bin/env python
# -- coding: utf-8 --
import rospy
import sys
import moveit_commander
from geometry_msgs.msg import Pose
from tf.transformations import quaternion_from_euler

def move_to_pose_goal(group, x, y, z, roll, pitch, yaw):
    rospy.loginfo("== Beweegt naar pose goal ==")

    # Zet de startpositie op de huidige toestand
    group.set_start_state_to_current_state()

    # Geef meer tijd om een plan te vinden
    group.set_planning_time(1000.0)

    q = quaternion_from_euler(roll, pitch, yaw)

    pose_target = Pose()
    pose_target.position.x = x
    pose_target.position.y = y
    pose_target.position.z = z
    pose_target.orientation.x = q[0]
    pose_target.orientation.y = q[1]
    pose_target.orientation.z = q[2]
    pose_target.orientation.w = q[3]

    group.set_pose_target(pose_target)
    success = group.go(wait=True)
    group.stop()
    group.clear_pose_targets()

    if success:
        rospy.loginfo("== Beweging voltooid ==")
    else:
        rospy.logwarn("[!] Kon niet naar doelpose bewegen")

if __name__ == '__main__':
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('sorteer_robot_pose_routine', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group = moveit_commander.MoveGroupCommander('arm')
    rospy.sleep(2.0)

    # Naar rechts 7 cm (y = +0.07), naar voren 20 cm (x = +0.20)
    x = 0.1
    y = -0.1
    z = 0.1
    roll = 0.0
    pitch = 0.0
    yaw = 0.0  # 90 graden

    move_to_pose_goal(group, x, y, z, roll, pitch, yaw)

    rospy.loginfo("== Routine voltooid ==")
    moveit_commander.roscpp_shutdown()
