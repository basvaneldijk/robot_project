#!/usr/bin/env python
import rospy
import actionlib
from my_demo.msg import CoordCommand, CoordCommandResult, MoveToPose, MoveToPoseGoal

class CoordHandlerServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('coord_handler', Coord_Command, self.execute_cb, False)
        self.moveit_client = actionlib.SimpleActionClient('moveit_planner', Move_To_Pose)
        self.server.start()
        rospy.loginfo("CoordHandlerServer gestart")

    def execute_cb(self, goal):
        rospy.loginfo("Ontvangen doel van client, stuur door naar MoveIt")
        moveit_goal = Move_To_PoseGoal(target_pose=goal.target_pose)
        self.moveit_client.wait_for_server()
        self.moveit_client.send_goal(moveit_goal)
        self.moveit_client.wait_for_result()

        result = self.moveit_client.get_result()
        self.server.set_succeeded(CoordCommandResult(success=result.success, message=result.message))

if __name__ == '__main__':
    rospy.init_node('coord_handler_server')
    CoordHandlerServer()
    rospy.spin()

