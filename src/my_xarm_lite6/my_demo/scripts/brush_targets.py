from geometry_msgs.msg import Pose
from tf.transformations import quaternion_from_euler
import math

def get_brush_targets():
    targets = {}

    # --- Bakje voor "Dun" Rechts boven
    Dun = Pose()
    Dun.position.x = 0.2
    Dun.position.y = 0.0
    Dun.position.z = 0.45
    Dun.orientation.w = 1.0

    q = quaternion_from_euler(math.radians(180),0,0 )

    Dun.orientation.x = q[0]
    Dun.orientation.y = q[1]
    Dun.orientation.z = q[2]
    Dun.orientation.w = q[3]

    targets["Dun"] = Dun

    # --- Bakje voor "Dik" Links onder
    Dik = Pose()
    Dik.position.x = 0.0947
    Dik.position.y = 0.2344
    Dik.position.z = 0.1223
    Dik.orientation.w = 1.0

    q = quaternion_from_euler(math.radians(180), 0, 0)

    Dik.orientation.x = q[0]
    Dik.orientation.y = q[1]
    Dik.orientation.z = q[2]
    Dik.orientation.w = q[3]

    targets["Dik"] = Dik

    # --- Bakje voor "Kwast" Rechts onder
    Kwast = Pose()
    Kwast.position.x = 0.0886
    Kwast.position.y = 0.332
    Kwast.position.z = 0.1304
    Kwast.orientation.w = 1.0

    q = quaternion_from_euler(math.radians(180), 0, 0)

    Kwast.orientation.x = q[0]
    Kwast.orientation.y = q[1]
    Kwast.orientation.z = q[2]
    Kwast.orientation.w = q[3]

    targets["Kwast"] = Kwast

    # --- Bakje voor "Pen" Links boven
    Pen = Pose()
    Pen.position.x = 0.005
    Pen.position.y = 0.2314
    Pen.position.z = 0.2053
    Pen.orientation.w = 1.0
    
    q = quaternion_from_euler(math.radians(180), 0, 0)

    Pen.orientation.x = q[0]
    Pen.orientation.y = q[1]
    Pen.orientation.z = q[2]
    Pen.orientation.w = q[3]

    targets["Pen"] = Pen

    return targets
