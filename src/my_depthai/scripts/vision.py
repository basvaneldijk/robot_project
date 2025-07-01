#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import numpy as np
import math
import json

class Detection:
    def __init__(self, label_id, x_min, y_min, x_max, y_max, confidence):
        self.label_id = label_id
        self.x_min = x_min
        self.y_min = y_min
        self.x_max = x_max
        self.y_max = y_max
        self.confidence = confidence

class VisionDebugNode:
    def __init__(self):
        rospy.init_node('vision_debug_node')
        self.bridge = CvBridge()
        self.frame = None
        self.detections = []

        self.label_map = {
            0: "1-norm",
            1: "2-dik",
            2: "3-rub",
            3: "4-pen"
        }

        rospy.Subscriber("/camera/image_raw", Image, self.image_callback)
        rospy.Subscriber("/detections", rospy.AnyMsg, self.detection_callback)

        rospy.loginfo("Vision-debug node gestart (klik op beeldvenster en druk op SPATIE voor analyse)")
        self.main_loop()

    def image_callback(self, msg):
        self.frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")

    def detection_callback(self, msg):
        try:
            msg_str = str(msg)
            json_start = msg_str.find('{')
            if json_start != -1:
                parsed = json.loads(msg_str[json_start:])
                self.detections = []
                for det in parsed.get("detections", []):
                    label = det.get("label", -1)
                    conf = det.get("confidence", 0.0)
                    x_min = det.get("x_min", 0)
                    y_min = det.get("y_min", 0)
                    x_max = det.get("x_max", 0)
                    y_max = det.get("y_max", 0)
                    self.detections.append(Detection(label, x_min, y_min, x_max, y_max, conf))
        except Exception as e:
            rospy.logwarn("Fout bij parsing detecties: {}".format(e))

    def main_loop(self):
        cv2.namedWindow("Live camerabeeld", cv2.WINDOW_NORMAL)
        while not rospy.is_shutdown():
            if self.frame is not None:
                display = self.frame.copy()

                # Laat alle detecties zien
                for det in self.detections:
                    label = self.label_map.get(det.label_id, str(det.label_id))
                    cv2.rectangle(display, (int(det.x_min), int(det.y_min)), (int(det.x_max), int(det.y_max)), (0, 255, 0), 2)
                    cv2.putText(display, label, (int(det.x_min), int(det.y_min)-10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)

                cv2.imshow("Live camerabeeld", display)
                key = cv2.waitKey(1) & 0xFF

                # SPACE = analyse
                if key == 32:
                    rospy.loginfo("▶️  Analyse gestart...")
                    coords = self.process()
                    if coords:
                        print("📍 Coördinaten (x y z rx ry rz):")
                        print("  {:.3f}, {:.3f}, {:.3f}, {:.3f}, {:.3f}, {:.3f}".format(*coords))
                    else:
                        print("⚠️  Geen kwast gevonden of analyse mislukt.")
                # q of ESC = exit
                elif key == ord('q') or key == 27:
                    rospy.loginfo("🔚 Programma afgesloten.")
                    break
        cv2.destroyAllWindows()

    def process(self):
        if self.frame is None or len(self.detections) == 0:
            rospy.logwarn("Geen beeld of geen detecties")
            return None

        frame = self.frame.copy()
        best_det = None
        max_area = 0
        for det in self.detections:
            if det.label_id in self.label_map:
                area = (det.x_max - det.x_min) * (det.y_max - det.y_min)
                if area > max_area:
                    max_area = area
                    best_det = det

        if best_det is None:
            return None

        x_min = int(best_det.x_min)
        y_min = int(best_det.y_min)
        x_max = int(best_det.x_max)
        y_max = int(best_det.y_max)
        roi = frame[y_min:y_max, x_min:x_max]

        cx, cy, rz_deg = self.analyse_roi(roi)
        rz_rad = math.radians(rz_deg)

        schaal_x = 0.002
        schaal_y = 0.002

        center_x = x_min + cx
        center_y = y_min + cy
        x = center_x * schaal_x
        y = center_y * schaal_y
        z = 0.0
        rx = 0.0
        ry = 0.0
        rz = rz_rad

        return (x, y, z, rx, ry, rz)

    def analyse_roi(self, roi):
        if roi is None or roi.size == 0:
            rospy.logwarn("Lege ROI ontvangen")
            return 0, 0, 0

        gray = cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)
        _, thresh = cv2.threshold(gray, 50, 255, cv2.THRESH_BINARY)
        contours_result = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        if isinstance(contours_result, tuple) and len(contours_result) == 3:
            _, contours, _ = contours_result
        else:
            contours = contours_result[0]

        if contours:
            c = max(contours, key=cv2.contourArea)
            M = cv2.moments(c)
            cx = int(M['m10'] / M['m00']) if M['m00'] != 0 else 0
            cy = int(M['m01'] / M['m00']) if M['m00'] != 0 else 0

            angle = 0
            if len(c) >= 5:
                ellipse = cv2.fitEllipse(c)
                angle = ellipse[2]
            return cx, cy, angle

        rospy.logwarn("Geen contouren gevonden in ROI")
        return 0, 0, 0

if __name__ == '__main__':
    try:
        VisionDebugNode()
    except rospy.ROSInterruptException:
        pass

