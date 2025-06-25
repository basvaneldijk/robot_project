#!/usr/bin/env python
import rospy
import actionlib
from my_demo.msg import CoordCommandAction, CoordCommandGoal
from geometry_msgs.msg import Pose
import tf

def send_goal():
    rospy.init_node('send_goal_client')

    # Maak de ActionClient aan
    client = actionlib.SimpleActionClient('coord_handler', CoordCommandAction)
    rospy.loginfo("Wachten op CoordHandlerServer...")
    client.wait_for_server()

    # Maak Pose aan
    pose = Pose()
    pose.position.x = -0.2  # 135 mm  meter
    pose.position.y = -0.2  # -250 mm  meter
    pose.position.z = 0.0  # 300 mm  meter

    # RPY (graden  rad) en dan quaternion berekenen
    roll_deg = 0
    pitch_deg = 0
    yaw_deg = 0

    roll = roll_deg * 3.14159 / 180.0
    pitch = pitch_deg * 3.14159 / 180.0
    yaw = yaw_deg * 3.14159 / 180.0

    q = tf.transformations.quaternion_from_euler(roll, pitch, yaw)
    pose.orientation.x = q[0]
    pose.orientation.y = q[1]
    pose.orientation.z = q[2]
    pose.orientation.w = q[3]

    # Stel doel in
    goal = CoordCommandGoal(target_pose=pose)
    rospy.loginfo("Verzend doel naar CoordHandlerServer...")
    client.send_goal(goal)
    client.wait_for_result()

    # Toon resultaat
    result = client.get_result()
    rospy.loginfo("Resultaat ontvangen: success=%s, message='%s'" % (result.success, result.message))

if __name__ == '__main__':
    send_goal()

