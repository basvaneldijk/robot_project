from geometry_msgs.msg import Pose
import moveit_commander

def get_brush_targets(move_group):
    targets = {}

    for name in ["Dun", "Dik", "Kwast", "Pen"]:
        try:
            # Laad de named target (pose) als joint values
            joint_goal = move_group.get_named_target_values(name)
            
            # Zet de robot tijdelijk op die named pose
            move_group.set_joint_value_target(joint_goal)
            pose = move_group.get_current_pose().pose

            targets[name] = pose
        except:
            rospy.logwarn("Kon named target '%s' niet laden vanuit MoveIt", name)

    return targets
