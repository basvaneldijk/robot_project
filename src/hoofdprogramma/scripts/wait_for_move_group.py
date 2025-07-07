#!/usr/bin/env python
import rospy
import time

if __name__ == "__main__":
    rospy.init_node("wait_for_move_group_node")
    rospy.loginfo("Wachten op move_group service...")

    try:
        rospy.wait_for_service('/move_group/get_planning_scene', timeout=30.0)
        rospy.loginfo("move_group service is beschikbaar.")
    except rospy.ROSException:
        rospy.logerr("Timeout: move_group service niet beschikbaar.")