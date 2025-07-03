#!/usr/bin/env python
# -- coding: utf-8 --

import rospy
from service.srv import Detectie, DetectieRequest, DetectieResponse
from service.srv import Lokaliseren, LokaliserenRequest, LokaliserenResponse
from service.srv import Omrekenen, OmrekenenRequest, OmrekenenResponse
from cv_bridge import CvBridge
import cv2

def main():
    rospy.init_node('main_node', anonymous=True)

    # Maak service proxies
    rospy.wait_for_service('detectie_service')
    detectie_client = rospy.ServiceProxy('detectie_service', Detectie)

    rospy.wait_for_service('lokaliseren_service')
    lokaliseren_client = rospy.ServiceProxy('lokaliseren_service', Lokaliseren)

    rospy.wait_for_service('omrekenen_service')
    omrekenen_client = rospy.ServiceProxy('omrekenen_service', Omrekenen)

    bridge = CvBridge()

    try:
        # Stap 1: detectie service aanroepen
        detectie_resp = detectie_client()
        mat_msg = detectie_resp.image
        class_nummer = detectie_resp.class_nummer

        # Image (ROS Image) omzetten naar OpenCV Mat
        cv_image = bridge.imgmsg_to_cv2(mat_msg, desired_encoding="bgr8")

        # Stap 2: lokaliseren service aanroepen
        lokaliseren_req = LokaliserenRequest()
        lokaliseren_req.image = mat_msg
        lokaliseren_resp = lokaliseren_client(lokaliseren_req)

        x = lokaliseren_resp.x
        y = lokaliseren_resp.y
        z = lokaliseren_resp.z
        rz = lokaliseren_resp.rz

        # Stap 3: omrekenen service aanroepen
        omrekenen_req = OmrekenenRequest()
        omrekenen_req.class_nummer = class_nummer
        omrekenen_req.x = x
        omrekenen_req.y = y
        omrekenen_req.rz = rz

        omrekenen_resp = omrekenen_client(omrekenen_req)

        x_final = omrekenen_resp.x
        y_final = omrekenen_resp.y
        z_final = omrekenen_resp.z
        rx_final = omrekenen_resp.rx
        ry_final = omrekenen_resp.ry
        rz_final = omrekenen_resp.rz

        rospy.loginfo("Eindresultaat:")
        rospy.loginfo("x: {}".format(x_final))
        rospy.loginfo("y: {}".format(y_final))
        rospy.loginfo("z: {}".format(z_final))
        rospy.loginfo("rx: {}".format(rx_final))
        rospy.loginfo("ry: {}".format(ry_final))
        rospy.loginfo("rz: {}".format(rz_final))

    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s" % e)

if __name__ == '__main__':
    main()
