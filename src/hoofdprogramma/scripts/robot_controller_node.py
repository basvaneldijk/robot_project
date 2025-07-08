import rospy
import moveit_commander
import subprocess
from geometry_msgs.msg import PoseStamped
from tf.transformations import quaternion_from_euler

class RobotController(object):
    def __init__(self):
        moveit_commander.roscpp_initialize([])

        rospy.logwarn("Wacht op move_group...")
        try:
            rospy.wait_for_service('/move_group/get_planning_scene', timeout=30)
        except rospy.ROSException:
            rospy.logerr("Timeout: move_group niet beschikbaar.")
            exit(1)

        self.group = moveit_commander.MoveGroupCommander("arm")
        rospy.loginfo("RobotController geladen")

        self.group.set_num_planning_attempts(20)
        self.group.set_planning_time(10)
        self.group.allow_replanning(True)
        self.group.set_goal_position_tolerance(0.01)
        self.group.set_goal_orientation_tolerance(0.01)

    def move_to_named_target(self, target_name):
        rospy.loginfo("Ga naar: %s", target_name)
        self.group.set_named_target(target_name)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()
        return success

    def move_to_pose(self, pose):
        rospy.loginfo("Beweeg naar opgegeven pose")
        self.group.set_start_state_to_current_state()

        pose_stamped = PoseStamped()
        pose_stamped.header.frame_id = "base_link"  # vervang dit indien jouw robot ander frame gebruikt
        pose_stamped.header.stamp = rospy.Time.now()
        pose_stamped.pose = pose

        self.group.set_pose_target(pose_stamped)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()
        return success

    def pick(self, pose, descend_distance=0.03):
        if not self.move_to_pose(pose):
            return False

        lowered_pose = Pose()
        lowered_pose.position = pose.position
        lowered_pose.position.z -= descend_distance
        lowered_pose.orientation = pose.orientation

        if not self.move_to_pose(lowered_pose):
            return False

        rospy.sleep(1.0)
        self.gripper_off()
        return self.move_to_pose(pose)

    def gripper_on(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '1'])

    def gripper_off(self):
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '0'])