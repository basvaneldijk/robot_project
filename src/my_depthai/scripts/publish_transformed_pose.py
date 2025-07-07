#!/usr/bin/env python
import rospy
import tf2_ros
import tf2_geometry_msgs
from geometry_msgs.msg import PoseStamped

class PoseTransformer:
    def __init__(self):
        rospy.init_node('kwast_pose_transformer')

        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.target_frame = "world"  # <-- hier reken je alles naar om

        self.topics = {
            "kwast_norm": rospy.Publisher("/kwast_norm_transformed", PoseStamped, queue_size=10),
            "kwast_dik": rospy.Publisher("/kwast_dik_transformed", PoseStamped, queue_size=10),
            "kwast_rub": rospy.Publisher("/kwast_rub_transformed", PoseStamped, queue_size=10),
            "kwast_pen": rospy.Publisher("/kwast_pen_transformed", PoseStamped, queue_size=10),
        }

        for topic_name in self.topics.keys():
            rospy.Subscriber("/" + topic_name, PoseStamped, self.callback, callback_args=topic_name)

    def callback(self, msg, topic_name):
        try:
            # Als de tijd 0 is (default of fout), gebruik dan rospy.Time.now()
            stamp = msg.header.stamp
            if stamp.to_sec() == 0.0:
                rospy.logwarn("Ongeldige tijdsstempel in %s, vervangen door rospy.Time.now()", topic_name)
                msg.header.stamp = rospy.Time.now()

            # Probeer de transform
            transformed = self.tf_buffer.transform(msg, self.target_frame, timeout=rospy.Duration(1.0))
            transformed.header.frame_id = self.target_frame
            self.topics[topic_name].publish(transformed)
            rospy.loginfo("%s omgezet naar %s", topic_name, self.target_frame)
        except Exception as e:
            rospy.logwarn("Transform van %s naar %s mislukt: %s", topic_name, self.target_frame, str(e))

if __name__ == '__main__':
    try:
        PoseTransformer()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

