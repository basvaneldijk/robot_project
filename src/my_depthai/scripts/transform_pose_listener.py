#!/usr/bin/env python
import rospy
import tf2_ros
import tf2_geometry_msgs
from geometry_msgs.msg import PoseStamped

class PoseTransformer:
    def __init__(self):
        rospy.init_node('pose_transform_listener', anonymous=True)

        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.target_frames = ['oak_rgb_camera_optical_frame', 'world']

        self.subscribers = {
            'kwast_norm': rospy.Subscriber('/kwast_norm', PoseStamped, self.callback),
            'kwast_dik': rospy.Subscriber('/kwast_dik', PoseStamped, self.callback),
            'kwast_rub': rospy.Subscriber('/kwast_rub', PoseStamped, self.callback),
            'kwast_pen': rospy.Subscriber('/kwast_pen', PoseStamped, self.callback),
        }

    def callback(self, pose_msg):
        # Check op ongeldige tijd
        if pose_msg.header.stamp.to_sec() == 0.0:
            rospy.logwarn("Pose met tijdsstempel 0 ontvangen, vervangen door rospy.Time.now()")
            pose_msg.header.stamp = rospy.Time.now()

        for frame in self.target_frames:
            try:
                transformed_pose = self.tf_buffer.transform(pose_msg, frame, timeout=rospy.Duration(1.0))
                rospy.logdebug("---- [%s] in frame [%s] ----", pose_msg.header.frame_id, frame)
                rospy.logdebug("Position: x=%.3f, y=%.3f, z=%.3f", 
                            transformed_pose.pose.position.x,
                            transformed_pose.pose.position.y,
                            transformed_pose.pose.position.z)
                rospy.logdebug("Orientation (quat): x=%.3f, y=%.3f, z=%.3f, w=%.3f",
                            transformed_pose.pose.orientation.x,
                            transformed_pose.pose.orientation.y,
                            transformed_pose.pose.orientation.z,
                            transformed_pose.pose.orientation.w)
            except Exception as e:
                rospy.logwarn("Transform to frame [%s] failed: %s", frame, str(e))

if __name__ == '__main__':
    try:
        PoseTransformer()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

