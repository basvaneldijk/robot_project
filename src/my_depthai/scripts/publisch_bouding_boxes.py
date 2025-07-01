#!/usr/bin/env python
'''
    circle_detector.py
    Purpose: displays boxes around detected objects
    @author Gerard Harkema
    @version 0.9 2023/01/05
    License: CC BY-NC-SA
'''

from _future_ import print_function

import roslib
import sys
import rospy
import cv2
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import sensor_msgs.point_cloud2 as pc2
from depthai_ros_msgs.msg import SpatialDetectionArray
import random
import json


class detection_displayer:

    def _init_(self, config_file):
        rospy.loginfo(config_file)
        self.display_image = False

        self.colors = []
        colors = []
        with open(config_file, 'r') as f:
            self.model_objects = json.loads(f.read())
            try:
                self.class_names = self.model_objects["class_names"]
                colors = self.model_objects["colors"]
                for color in colors:
                    self.colors.append(colors[color])
            except:
                self.class_names = self.model_objects["mappings"]["labels"]
                for class_name in self.class_names:
                    self.colors.append("#" + ''.join([random.choice('0123456789ABCDEF') for j in range(6)]))

        self.image_pub = rospy.Publisher("/image_out", Image, queue_size=10)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/image_in", Image, self.image_callback)
        self.detections_sub = rospy.Subscriber("/detections", SpatialDetectionArray, self.detections_callback)

        self.image_received = False

    def detections_callback(self, detections_data):
        if self.image_received:
            for detection in detections_data.detections:
                x1 = detection.bbox.center.x - (detection.bbox.size_x / 2)
                y1 = detection.bbox.center.y - (detection.bbox.size_y / 2)
                x2 = detection.bbox.center.x + (detection.bbox.size_x / 2)
                y2 = detection.bbox.center.y + (detection.bbox.size_y / 2)

                x = detection.position.x
                y = detection.position.y
                z = detection.position.z

                class_index = detection.results[0].id
                class_color = self.colors[int(class_index)].strip("#")
                class_color = tuple(int(class_color[i:i + 2], 16) for i in (0, 2, 4))

                # Teken standaard bounding box
                cv2.rectangle(self.image, (int(x1), int(y1)), (int(x2), int(y2)), class_color, 2)

                # --- MIN AREA RECT ---
                box_points = np.array([
                    [x1, y1],
                    [x2, y1],
                    [x2, y2],
                    [x1, y2]
                ], dtype=np.float32)

                rect = cv2.minAreaRect(box_points)
                box = cv2.boxPoints(rect)
                box = np.int0(box)

                # Teken min area rect
                cv2.drawContours(self.image, [box], 0, (0, 255, 255), 2)

                rect_center = rect[0]  # (x, y)
                rect_angle = rect[2]   # rotatiehoek

                # Tekst over minAreaRect
                text = 'angle: %.2f deg' % rect_angle
                cv2.putText(self.image, text, (int(x1)+5, int(y2)+95), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)
                text = 'center: (%.1f, %.1f)' % (rect_center[0], rect_center[1])
                cv2.putText(self.image, text, (int(x1)+5, int(y2)+120), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)
                # --- EINDE MIN AREA RECT ---

                # Tekst over object
                text = '%s: %.2f%%' % (self.class_names[detection.results[0].id], detection.results[0].score * 100)
                image = cv2.putText(self.image, text, (int(x1)+5, int(y2)-5), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)
                text = 'x: %.3f m' % (x)
                image = cv2.putText(self.image, text, (int(x1)+5, int(y2)+20), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)
                text = 'y: %.3f m' % (y)
                image = cv2.putText(self.image, text, (int(x1)+5, int(y2)+45), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)
                text = 'z: %.3f m' % (z)
                image = cv2.putText(self.image, text, (int(x1)+5, int(y2)+70), cv2.FONT_HERSHEY_SIMPLEX, 1, class_color, 2, cv2.LINE_AA)

            try:
                self.image_pub.publish(self.bridge.cv2_to_imgmsg(self.image, "bgr8"))
            except CvBridgeError as e:
                print(e)
            self.image_received = False

    def image_callback(self, data):
        try:
            self.image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        self.image_received = True

        if self.display_image:
            cv2.imshow("Detections window", self.image)
            cv2.waitKey(3)


def main(args):
    rospy.init_node('publisch_bouding_boxes', anonymous=True)

    node_name = rospy.get_name()

    nnConfig = rospy.get_param(node_name + '/nnConfig')  # node_name/argsname
    resourceBaseFolder = rospy.get_param(node_name + '/resourceBaseFolder')  # node_name/argsname

    ic = detection_displayer(resourceBaseFolder + '/' + nnConfig)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")


if __name__ == '__main__':
    main(sys.argv)
