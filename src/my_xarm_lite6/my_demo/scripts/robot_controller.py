#!/usr/bin/env python
import rospy
import moveit_commander
from geometry_msgs.msg import Pose
import subprocess
from tf.transformations import quaternion_from_euler
import math

from brush_targets import get_brush_targets

class RobotController(object):
    def __init__(self):
        moveit_commander.roscpp_initialize([])
        self.group = moveit_commander.MoveGroupCommander("arm")
        rospy.loginfo("RobotController geladen")

        self.group.set_num_planning_attempts(20)
        self.group.set_planning_time(10)
        self.group.allow_replanning(True)
        self.group.set_goal_position_tolerance(0.01)
        self.group.set_goal_orientation_tolerance(0.01)

    def move_to_pose(self, pose, max_attempts=10):
        attempt = 0
        success = False

        while attempt < max_attempts and not success and not rospy.is_shutdown():
            rospy.loginfo("Poging %d: beweeg naar doelpose...", attempt + 1)
            self.group.set_start_state_to_current_state()
            self.group.set_pose_target(pose)

            current_pose = self.group.get_current_pose().pose
            rospy.loginfo("Huidige pose: x=%.3f y=%.3f z=%.3f | orient: x=%.3f y=%.3f z=%.3f w=%.3f",
                          current_pose.position.x, current_pose.position.y, current_pose.position.z,
                          current_pose.orientation.x, current_pose.orientation.y,
                          current_pose.orientation.z, current_pose.orientation.w)

            rospy.loginfo("Doel pose: x=%.3f y=%.3f z=%.3f | orient: x=%.3f y=%.3f z=%.3f w=%.3f",
                          pose.position.x, pose.position.y, pose.position.z,
                          pose.orientation.x, pose.orientation.y,
                          pose.orientation.z, pose.orientation.w)

            success = self.group.go(wait=True)
            self.group.stop()
            self.group.clear_pose_targets()

            if not success:
                rospy.logwarn("Planning mislukt bij poging %d", attempt + 1)
                rospy.sleep(0.5)
            attempt += 1

        return success

    def go_home(self):
        rospy.loginfo("Ga naar homepositie")
        self.group.set_named_target("home")
        self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()

    def gripper_on(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '1'])

    def gripper_off(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '0'])

def main():
    rospy.init_node('robot_controller_node')
    rc = RobotController()
    targets = get_brush_targets()

    rospy.loginfo("Ga naar homepositie")
    rc.go_home()
    rospy.sleep(1.0)

    place = targets.get("Dik")
    if place:
        rospy.loginfo("Ga naar positie: Dik")
        if rc.move_to_pose(place):
            rospy.loginfo("Beweging naar Dik gelukt!")
        else:
            rospy.logwarn("Beweging naar Dik mislukt")
    else:
        rospy.logwarn("Positie 'Dik' niet gevonden!")

if __name__ == "__main__":
    main()
