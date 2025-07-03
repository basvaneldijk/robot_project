#!/usr/bin/env python
import rospy
import moveit_commander
import subprocess
import json
from geometry_msgs.msg import Pose
from tf.transformations import quaternion_from_euler
from std_msgs.msg import String

class RobotController(object):
    def _init_(self):
        moveit_commander.roscpp_initialize([])
        self.group = moveit_commander.MoveGroupCommander("arm")
        rospy.loginfo("RobotController geladen")

        self.group.set_num_planning_attempts(20)
        self.group.set_planning_time(10)
        self.group.allow_replanning(True)
        self.group.set_goal_position_tolerance(0.01)
        self.group.set_goal_orientation_tolerance(0.01)

    def move_to_named_target(self, target_name):
        rospy.loginfo("Ga naar named target: %s" % target_name)
        self.group.set_named_target(target_name)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()
        return success

    def move_to_pose(self, pose):
        rospy.loginfo("Beweeg naar opgegeven pose")
        self.group.set_start_state_to_current_state()
        self.group.set_pose_target(pose)
        success = self.group.go(wait=True)
        self.group.stop()
        self.group.clear_pose_targets()
        return success

    def pick(self, pose, descend_distance=0.03):
        rospy.loginfo("Start pick-operatie")

        if not self.move_to_pose(pose):
            rospy.logwarn("Kan niet naar begin-pick-pose bewegen")
            return False

        lowered_pose = Pose()
        lowered_pose.position.x = pose.position.x
        lowered_pose.position.y = pose.position.y
        lowered_pose.position.z = pose.position.z - descend_distance
        lowered_pose.orientation = pose.orientation

        if not self.move_to_pose(lowered_pose):
            rospy.logwarn("Kan niet naar verlaagde pick-pose bewegen")
            return False

        rospy.sleep(1.0)
        self.gripper_off()

        if not self.move_to_pose(pose):
            rospy.logwarn("Kan niet terug omhoog bewegen na pick")
            return False

        rospy.loginfo("Pick-operatie voltooid")
        return True

    def gripper_on(self):
        rospy.loginfo("Gripper AAN")
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '1'])

    def gripper_off(self):
        rospy.loginfo("Gripper UIT")
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '0'])

def kwast_callback(msg):
    try:
        data = json.loads(msg.data)
        rospy.loginfo("Ontvangen data van hoofdprogramma: %s", data)

        pose = Pose()
        pose.position.x = data['x']
        pose.position.y = data['y']
        pose.position.z = data['z']
        q = quaternion_from_euler(data['rx'], data['ry'], data['rz'])
        pose.orientation.x = q[0]
        pose.orientation.y = q[1]
        pose.orientation.z = q[2]
        pose.orientation.w = q[3]

        kwast_type = data['type'].lower()

        rc = RobotController()

        if not rc.move_to_named_target("home"):
            rospy.logwarn("Beweging naar homepositie mislukt")
            return

        rc.gripper_on()

        if not rc.pick(pose):
            rospy.logwarn("Pick mislukt")
            return

        mapping = {
            "dun": "BakRB",
            "dik": "BakRO",
            "kwast": "BakLB",
            "pen": "BakLO"
        }
        doel = mapping.get(kwast_type)

        if doel and rc.move_to_named_target(doel):
            rospy.loginfo("Beweging naar %s gelukt" % doel)
            rc.gripper_on()
        else:
            rospy.logwarn("Onbekend of mislukt doel: %s" % kwast_type)

        rc.move_to_named_target("home")
        rc.gripper_off()

    except Exception as e:
        rospy.logerr("Fout bij verwerken data: %s" % str(e))

def main():
    rospy.init_node('robot_controller_node')
    rospy.Subscriber("/kwast_data", String, kwast_callback)
    rospy.loginfo("RobotController Node actief, wacht op data via /kwast_data...")
    rospy.spin()

if __name__ == "__main__":
    main()