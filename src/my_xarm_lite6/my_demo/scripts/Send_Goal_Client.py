#!/usr/bin/env python
import rospy
import actionlib
from ufactory_motion.msg import Coord_Command
from geometry_msgs.msg import Pose

def send_goal():
    rospy.init_node('Send_Goal_Client')

    client = actionlib.SimpleActionClient('coord_handler', Coord_Command)
    client.wait_for_server()

    pose = Pose()
    pose.position.x = 0.3
    pose.position.y = 0.0
    pose.position.z = 0.2
    pose.orientation.w = 1.0  # Geen rotatie

    goal = CoordCommandGoal(target_pose=pose)
    client.send_goal(goal)
    client.wait_for_result()

    result = client.get_result()
    rospy.loginfo(f"Resultaat: success={result.success}, message='{result.message}'")

if __name__ == '__main__':
    send_goal()

