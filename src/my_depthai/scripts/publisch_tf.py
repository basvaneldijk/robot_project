#!/usr/bin/env python

from __future__ import print_function

import rospy
import cv2
import numpy as np
import json
import math
import random

from tf2_ros import TransformBroadcaster
from geometry_msgs.msg import TransformStamped, PoseStamped
from visualization_msgs.msg import Marker
from depthai_ros_msgs.msg import SpatialDetectionArray


class Publisch_TF:

    def __init__(self, config_file):
        rospy.loginfo(config_file)

        with open(config_file, 'r') as f:
            model_data = json.load(f)
            self.class_names = model_data.get("class_names") or model_data["mappings"]["labels"]

        self.class_names_dict = {label: 0 for label in self.class_names}

        self.detections_sub = rospy.Subscriber(
            "/stereo_inertial_nn_publisher/color/detections",
            SpatialDetectionArray,
            self.spatial_dections_callback
        )

        self.tf_broadcaster = TransformBroadcaster()
        self.pubTextMarker = rospy.Publisher("color/ObjectText", Marker, queue_size=10)

        self.label_to_topic = {
            "1-norm": rospy.Publisher("/kwast_norm", PoseStamped, queue_size=10),
            "2-dik": rospy.Publisher("/kwast_dik", PoseStamped, queue_size=10),
            "3-rub": rospy.Publisher("/kwast_rub", PoseStamped, queue_size=10),
            "4-pen": rospy.Publisher("/kwast_pen", PoseStamped, queue_size=10),
        }

    def spatial_dections_callback(self, msg):
        for label in self.class_names:
            self.class_names_dict[label] = 0

        for detection in msg.detections:
            best_result = max(detection.results, key=lambda r: r.score)
            class_id = best_result.id
            label_name = self.class_names[class_id]

            self.class_names_dict[label_name] += 1
            position = detection.position
            child_frame_id = "{}_{}".format(label_name, self.class_names_dict[label_name])

            # TF publishing
            t = TransformStamped()
            t.header.stamp = rospy.Time.now()
            t.header.frame_id = "oak_rgb_camera_optical_frame"
            t.child_frame_id = child_frame_id
            t.transform.translation.x = position.x
            t.transform.translation.y = -position.y
            t.transform.translation.z = position.z
            t.transform.rotation.x = 0.0
            t.transform.rotation.y = 0.0
            t.transform.rotation.z = 0.0
            t.transform.rotation.w = 1.0
            self.tf_broadcaster.sendTransform(t)

            # Marker
            text_marker = Marker()
            text_marker.header.stamp = rospy.Time.now()
            text_marker.header.frame_id = child_frame_id
            text_marker.type = Marker.TEXT_VIEW_FACING
            text_marker.pose.position.x = 0.0
            text_marker.pose.position.y = 0.0
            text_marker.pose.position.z = -0.03
            text_marker.scale.x = text_marker.scale.y = text_marker.scale.z = 0.06
            text_marker.color.r = 1.0
            text_marker.color.g = 1.0
            text_marker.color.b = 1.0
            text_marker.color.a = 1.0
            text_marker.text = child_frame_id
            text_marker.lifetime = rospy.Duration(10.0)
            self.pubTextMarker.publish(text_marker)

            # Bereken rz met minAreaRect
            x1 = detection.bbox.center.x - detection.bbox.size_x / 2.0
            y1 = detection.bbox.center.y - detection.bbox.size_y / 2.0
            x2 = detection.bbox.center.x + detection.bbox.size_x / 2.0
            y2 = detection.bbox.center.y + detection.bbox.size_y / 2.0

            box = np.array([
                [x1, y1],
                [x2, y1],
                [x2, y2],
                [x1, y2]
            ], dtype=np.float32)

            rect = cv2.minAreaRect(box)
            rz_rad = math.radians(rect[2])  # draaihoek naar rad

            # Publish pose per kwast-type
            if label_name in self.label_to_topic and self.class_names_dict[label_name] == 1:
                pose = PoseStamped()
                pose.header.stamp = rospy.Time.now()
                pose.header.frame_id = "oak_rgb_camera_optical_frame"
                pose.pose.position.x = position.x
                pose.pose.position.y = -position.y
                pose.pose.position.z = position.z
                pose.pose.orientation.x = 0.0
                pose.pose.orientation.y = 0.0
                pose.pose.orientation.z = math.sin(rz_rad / 2.0)
                pose.pose.orientation.w = math.cos(rz_rad / 2.0)
                self.label_to_topic[label_name].publish(pose)


def main(args):
    rospy.init_node('publisch_tf', anonymous=True)
    node_name = rospy.get_name()
    nnConfig = rospy.get_param(node_name + '/nnConfig')
    resourceBaseFolder = rospy.get_param(node_name + '/resourceBaseFolder')
    Publisch_TF(resourceBaseFolder + '/' + nnConfig)
    rospy.spin()

if __name__ == '__main__':
    import sys
    main(sys.argv)

