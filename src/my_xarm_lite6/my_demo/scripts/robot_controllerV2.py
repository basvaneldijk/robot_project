#!/usr/bin/env python
import rospy
import moveit_commander
import subprocess
import socket
from geometry_msgs.msg import Pose
from tf.transformations import quaternion_from_euler

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

        # Beweeg naar originele pose (boven het object)
        if not self.move_to_pose(pose):
            rospy.logwarn("Kan niet naar begin-pick-pose bewegen")
            return False

        # Verlaag de pose met 3 cm
        lowered_pose = Pose()
        lowered_pose.position.x = pose.position.x
        lowered_pose.position.y = pose.position.y
        lowered_pose.position.z = pose.position.z - descend_distance
        lowered_pose.orientation = pose.orientation

        # Beweeg naar verlaagde pose
        if not self.move_to_pose(lowered_pose):
            rospy.logwarn("Kan niet naar verlaagde pick-pose bewegen")
            return False

        # Sluit gripper
        rospy.sleep(1.0)
        self.gripper_off()

        # Ga terug naar originele hoogte
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

def get_pose_from_camera(host="127.0.0.1", port=5050):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((host, port))
        data = s.recv(1024).decode("utf-8")
        s.close()
        rospy.loginfo("Ontvangen data van vision: %s" % data)

        if data == "not_found":
            raise ValueError("Geen object gevonden via vision")

        x, y, z, rx, ry, rz = [float(val) for val in data.split(",")]
    except Exception as e:
        rospy.logwarn("Fout bij ophalen camera-pose: %s" % str(e))
        rospy.logwarn("Gebruik testdata als fallback")

        # Testdata handmatig invullen (in meters en radialen!)
        x = 0.078
        y = -0.025
        z = 0.3
        rx = 3.14
        ry = 0.0
        rz = 1.57

    q = quaternion_from_euler(rx, ry, rz)
    pose = Pose()
    pose.position.x = x
    pose.position.y = y
    pose.position.z = z
    pose.orientation.x = q[0]
    pose.orientation.y = q[1]
    pose.orientation.z = q[2]
    pose.orientation.w = q[3]
    return pose

def main():
    rospy.init_node('robot_controller_node')
    rc = RobotController()

    if rc.move_to_named_target("home"):
        rospy.loginfo("Beweging naar homepositie gelukt!")
        rc.gripper_on()
    else:
        rospy.logwarn("Beweging naar homepositie mislukt")

    # Vraag pose op via vision
    pose = get_pose_from_camera()
    if pose:
        if rc.pick(pose):
            rospy.loginfo("Pick geslaagd")
        else:
            rospy.logwarn("Pick mislukt")
            return
    else:
        rospy.logwarn("Geen bruikbare kwastpositie ontvangen")
        return

    # Vraag gebruiker naar kwasttype
    kwast_type = raw_input("Welke kwast is gedetecteerd? (Dun, Dik, Kwast, Pen): ").strip().lower()
    mapping = {
        "dun": "BakRB",
        "dik": "BakRO",
        "kwast": "BakLB",
        "pen": "BakLO"
    }
    doel = mapping.get(kwast_type)

    if doel:
        rospy.loginfo("Ga naar bakje: %s" % doel)
        if rc.move_to_named_target(doel):
            rospy.loginfo("Beweging naar %s gelukt!" % doel)
            rc.gripper_on()
        else:
            rospy.logwarn("Beweging naar %s mislukt!" % doel)
    else:
        rospy.logwarn("Onbekend type kwast: %s" % kwast_type)

    if rc.move_to_named_target("home"):
        rospy.loginfo("Cyclus voltooid")
        rc.gripper_off()

if __name__ == "__main__":
    main()
