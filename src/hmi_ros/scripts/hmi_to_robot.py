#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

class HMIToRobot:
    def __init__(self):
        rospy.init_node('hmi_to_robot')
        self.cmd_sub = rospy.Subscriber('/hmi_commands', String, self.command_cb)
        self.robot_pub = rospy.Publisher('/scaled_pos_joint_traj_controller/command', JointTrajectory, queue_size=10)

    def command_cb(self, msg):
        rospy.loginfo("Ontvangen HMI commando: %s", msg.data)

        if msg.data == "home":
            self.go_to_home_position()
        elif msg.data == "start_single":
            self.start_single()
        elif msg.data == "start_loop":
            self.start_loop()
        elif msg.data == "stop":
            self.stop()
        else:
            rospy.logwarn("Onbekend commando ontvangen: %s", msg.data)

    def go_to_home_position(self):
        rospy.loginfo("Stuur robot naar homepositie.")
        traj = JointTrajectory()
        traj.joint_names = [
            "joint1", "joint2", "joint3", "joint4", "joint5", "joint6"
        ]
        point = JointTrajectoryPoint()
        point.positions = [0, 0, 0, 0, 0, 0]  # Homepositie
        point.time_from_start = rospy.Duration(2.0)
        traj.points.append(point)
        self.robot_pub.publish(traj)

    def start_single(self):
        rospy.loginfo("Start enkele bewerking.")
        # Voeg hier specifieke traject of service aanroep toe

    def start_loop(self):
        rospy.loginfo("Start herhalende bewerking (loop).")
        # Voeg hier herhalende logica toe

    def stop(self):
        rospy.loginfo("Stop bewerking.")
        # Voeg hier stopfunctionaliteit toe

if __name__ == '__main__':
    HMIToRobot()
    rospy.spin()

