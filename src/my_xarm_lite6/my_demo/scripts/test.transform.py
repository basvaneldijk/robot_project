#!/usr/bin/env python
import rospy
import tf2_ros
import tf2_geometry_msgs
from geometry_msgs.msg import PointStamped

def main():
    rospy.init_node('transform_test_node')

    tf_buffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tf_buffer)

    # Geef je testinputpunt op in het camera_frame
    test_point = PointStamped()
    test_point.header.stamp = rospy.Time.now()
    test_point.header.frame_id = "camera_link"  # Zorg dat dit overeenkomt met je URDF
    test_point.point.x = 0.614
    test_point.point.y = 0.045
    test_point.point.z = -0.024

    target_frame = "xarm_link"  # Of bijvoorbeeld 'base_link', afhankelijk van je robot

    rospy.loginfo("Wachten op transform van %s naar %s...", test_point.header.frame_id, target_frame)
    try:
        tf_buffer.can_transform(target_frame, test_point.header.frame_id, rospy.Time(0), rospy.Duration(5.0))
        transformed_point = tf_buffer.transform(test_point, target_frame, rospy.Duration(1.0))
        rospy.loginfo("Getransformeerd punt:\n x: %.3f\n y: %.3f\n z: %.3f",
                      transformed_point.point.x,
                      transformed_point.point.y,
                      transformed_point.point.z)
    except Exception as e:
        rospy.logerr("Kon transform niet uitvoeren: %s", str(e))

if __name__ == '__main__':
    main()
