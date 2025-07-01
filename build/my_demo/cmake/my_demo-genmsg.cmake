# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "my_demo: 7 messages, 0 services")

set(MSG_I_FLAGS "-Imy_demo:/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(my_demo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" "actionlib_msgs/GoalID:geometry_msgs/Pose:my_demo/BrushPoseGoal:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" ""
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" ""
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" "actionlib_msgs/GoalID:my_demo/BrushPoseResult:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:my_demo/BrushPoseActionResult:my_demo/BrushPoseGoal:geometry_msgs/Pose:my_demo/BrushPoseActionGoal:std_msgs/Header:my_demo/BrushPoseResult:my_demo/BrushPoseActionFeedback:geometry_msgs/Quaternion:my_demo/BrushPoseFeedback:geometry_msgs/Point"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_custom_target(_my_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_demo" "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" "actionlib_msgs/GoalID:my_demo/BrushPoseFeedback:actionlib_msgs/GoalStatus:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)
_generate_msg_cpp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
)

### Generating Services

### Generating Module File
_generate_module_cpp(my_demo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(my_demo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(my_demo_generate_messages my_demo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_cpp _my_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_demo_gencpp)
add_dependencies(my_demo_gencpp my_demo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_demo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)
_generate_msg_eus(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
)

### Generating Services

### Generating Module File
_generate_module_eus(my_demo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(my_demo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(my_demo_generate_messages my_demo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_eus _my_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_demo_geneus)
add_dependencies(my_demo_geneus my_demo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_demo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)
_generate_msg_lisp(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
)

### Generating Services

### Generating Module File
_generate_module_lisp(my_demo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(my_demo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(my_demo_generate_messages my_demo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_lisp _my_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_demo_genlisp)
add_dependencies(my_demo_genlisp my_demo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_demo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)
_generate_msg_nodejs(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
)

### Generating Services

### Generating Module File
_generate_module_nodejs(my_demo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(my_demo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(my_demo_generate_messages my_demo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_nodejs _my_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_demo_gennodejs)
add_dependencies(my_demo_gennodejs my_demo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_demo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)
_generate_msg_py(my_demo
  "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
)

### Generating Services

### Generating Module File
_generate_module_py(my_demo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(my_demo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(my_demo_generate_messages my_demo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseGoal.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionResult.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseAction.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/my_demo/share/my_demo/msg/BrushPoseActionFeedback.msg" NAME_WE)
add_dependencies(my_demo_generate_messages_py _my_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_demo_genpy)
add_dependencies(my_demo_genpy my_demo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_demo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_demo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(my_demo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(my_demo_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(my_demo_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_demo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(my_demo_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(my_demo_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(my_demo_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_demo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(my_demo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(my_demo_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(my_demo_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_demo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(my_demo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(my_demo_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(my_demo_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_demo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(my_demo_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(my_demo_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(my_demo_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
