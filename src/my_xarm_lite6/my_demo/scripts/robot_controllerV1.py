#!/usr/bin/env python
import rospy
import moveit_commander
import subprocess

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

    def gripper_on(self):
        rospy.loginfo("Gripper AAN")
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '1'])

    def gripper_off(self):
        rospy.loginfo("Gripper UIT")
        subprocess.call(['rosservice', 'call', '/ufactory/vacuum_gripper_set', '0'])

def main():
    rospy.init_node('robot_controller_node')
    rc = RobotController()

    if rc.move_to_named_target("home"):
        rospy.loginfo("Beweging naar homepositie gelukt!")
        rc.gripper_on () #grippier open

    else:
        rospy.logwarn("Beweging naar homepositie mislukt")

    # Ga naar sorteerpositie
    if rc.move_to_named_target("sort"):
        rospy.loginfo("Beweging naar sorteerpositie gelukt!")
        rc.gripper_off()  # Gripper aanzetten na oppakken
    else:
        rospy.logwarn("Beweging naar sorteerpositie mislukt")
        return

    # Vraag om type kwast
    kwast_type = raw_input("Welke kwast is gedetecteerd? (bijv. Dun, Dik, Kwast, Pen): ").strip().lower()

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
            rc.gripper_on()  # Gripper uit bij afleveren
        else:
            rospy.logwarn("Beweging naar %s mislukt!" % doel)
    else:
        rospy.logwarn("Onbekend type kwast: %s" % kwast_type)
    if rc.move_to_named_target("home"):
        rospy.loginfo("Cyclus klaar")
        rc.gripper_on ()

if __name__ == "__main__":
    main()
