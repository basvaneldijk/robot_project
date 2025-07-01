#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from hoofdprogramma.srv import StartCarousel, StartVision
from hoofdprogramma.msg import BrushPoseAction, BrushPoseGoal
import actionlib

def start_robot_cycle():
    rospy.wait_for_service('/carousel/start')
    carousel_start = rospy.ServiceProxy('/carousel/start', StartCarousel)
    rospy.loginfo("Start carrousel...")
    carousel_result = carousel_start()
    if not carousel_result.success:
        rospy.logerr("Carrousel starten mislukt!")
        return

    rospy.wait_for_service('/vision/start')
    vision_start = rospy.ServiceProxy('/vision/start', StartVision)
    rospy.loginfo("Start vision systeem...")
    vision_result = vision_start()
    pose = vision_result.pose

    rospy.loginfo("Pose ontvangen: %s", pose)

    client = actionlib.SimpleActionClient('/move_brush', BrushPoseAction)
    client.wait_for_server()
    goal = BrushPoseGoal()
    goal.target_pose = pose
    client.send_goal(goal)
    client.wait_for_result()
    rospy.loginfo("MoveIt resultaat: %s", client.get_result().status)

def main():
    rospy.init_node('hoofdprogramma')
    rospy.loginfo("Hoofdprogramma gestart.")
    start_robot_cycle()
    rospy.spin()

if __name__ == '__main__':
    main()


# toevoegen voor sorteren van kwasten
#from robot_controller import RobotController
#from brush_targets import get_brush_targets

#rc = RobotController()
#targets = get_brush_targets()

# Stel: dit komt van je vision systeem
#brush_type = "Smal"
#pick_pose = ...  # komt van camera

#place_pose = targets.get(brush_type)

#if place_pose:
#    rc.move_to_pose(pick_pose)
#    rc.gripper_on()
#    rospy.sleep(1.0)
#    rc.move_to_pose(place_pose)
#    rc.gripper_off()
#else:
#    rospy.logwarn("Onbekend kwasttype: %s", brush_type)
