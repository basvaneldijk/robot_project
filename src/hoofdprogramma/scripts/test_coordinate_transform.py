#!/usr/bin/env python
import numpy as np

def transform_camera_to_ros(point):
    """
    Transformeer een punt van camera-frame naar ROS-frame,
    inclusief rotatie n translatie.
    """

    cam_point = np.array(point).reshape(3, 1)

    #  Correcte rotatie camera  ROS (op basis van jouw uitleg)
    R = np.array([
        [0, 1,  0],
        [1, 0,  0],
        [0, 0, -1]
    ])

    #  Aangepaste translatie gebaseerd op test (schatting)
    T = np.array([
        [0.0228],
        [0.817],
        [0.391]
    ])

    ros_point = np.dot(R, cam_point) + T
    return ros_point.flatten()

def main():
    print "Test: Camera  ROS cordinaten transformatie"
    print "--------------------------------------------"
    print "Camera-frame: X = rechts, Y = vooruit, Z = omlaag"
    print "ROS-frame:    X = vooruit, Y = rechts, Z = omhoog"
    print "Geef cordinaten in (bijv. 0.1 0.2 0.3)"

    while True:
        try:
            raw = raw_input("\nVoer X Y Z in (of 'q' om te stoppen): ")
            if raw.strip().lower() in ["q", "quit", "exit"]:
                break

            parts = raw.strip().split()
            if len(parts) != 3:
                print "  Geef precies 3 getallen op, gescheiden door spaties."
                continue

            x, y, z = map(float, parts)
            ros_point = transform_camera_to_ros((x, y, z))

            print "  ROS-cordinaten (X vooruit, Y rechts, Z omhoog):"
            print "   X: %.3f  Y: %.3f  Z: %.3f" % tuple(ros_point)

        except Exception as e:
            print " Fout bij invoer of berekening:", str(e)

if __name__ == "__main__":
    main()
