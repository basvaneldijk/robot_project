# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hoofdprogramma: 8 messages, 0 services")

set(MSG_I_FLAGS "-Ihoofdprogramma:/home/student/Git-projects/robot_project/src/hoofdprogramma/msg;-Ihoofdprogramma:/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hoofdprogramma_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:hoofdprogramma/PickAndPlaceResult:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:hoofdprogramma/PickAndPlaceFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" ""
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" "actionlib_msgs/GoalID:geometry_msgs/Pose:hoofdprogramma/PickAndPlaceGoal:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" ""
)

get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_custom_target(_hoofdprogramma_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hoofdprogramma" "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" "hoofdprogramma/PickAndPlaceFeedback:actionlib_msgs/GoalID:hoofdprogramma/PickAndPlaceResult:actionlib_msgs/GoalStatus:hoofdprogramma/PickAndPlaceActionResult:geometry_msgs/Quaternion:geometry_msgs/Pose:hoofdprogramma/PickAndPlaceActionGoal:hoofdprogramma/PickAndPlaceActionFeedback:std_msgs/Header:geometry_msgs/Point:geometry_msgs/PoseStamped:hoofdprogramma/PickAndPlaceGoal"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_cpp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg"
  "${MSG_I_FLAGS}"
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
)

### Generating Services

### Generating Module File
_generate_module_cpp(hoofdprogramma
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hoofdprogramma_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hoofdprogramma_generate_messages hoofdprogramma_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_cpp _hoofdprogramma_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hoofdprogramma_gencpp)
add_dependencies(hoofdprogramma_gencpp hoofdprogramma_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hoofdprogramma_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_eus(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg"
  "${MSG_I_FLAGS}"
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
)

### Generating Services

### Generating Module File
_generate_module_eus(hoofdprogramma
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hoofdprogramma_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hoofdprogramma_generate_messages hoofdprogramma_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_eus _hoofdprogramma_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hoofdprogramma_geneus)
add_dependencies(hoofdprogramma_geneus hoofdprogramma_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hoofdprogramma_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_lisp(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg"
  "${MSG_I_FLAGS}"
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
)

### Generating Services

### Generating Module File
_generate_module_lisp(hoofdprogramma
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hoofdprogramma_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hoofdprogramma_generate_messages hoofdprogramma_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_lisp _hoofdprogramma_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hoofdprogramma_genlisp)
add_dependencies(hoofdprogramma_genlisp hoofdprogramma_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hoofdprogramma_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_nodejs(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg"
  "${MSG_I_FLAGS}"
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
)

### Generating Services

### Generating Module File
_generate_module_nodejs(hoofdprogramma
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hoofdprogramma_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hoofdprogramma_generate_messages hoofdprogramma_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_nodejs _hoofdprogramma_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hoofdprogramma_gennodejs)
add_dependencies(hoofdprogramma_gennodejs hoofdprogramma_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hoofdprogramma_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)
_generate_msg_py(hoofdprogramma
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg"
  "${MSG_I_FLAGS}"
  "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
)

### Generating Services

### Generating Module File
_generate_module_py(hoofdprogramma
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hoofdprogramma_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hoofdprogramma_generate_messages hoofdprogramma_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceResult.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceActionGoal.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/src/hoofdprogramma/msg/KwastDetection.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceFeedback.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Git-projects/robot_project/devel/.private/hoofdprogramma/share/hoofdprogramma/msg/PickAndPlaceAction.msg" NAME_WE)
add_dependencies(hoofdprogramma_generate_messages_py _hoofdprogramma_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hoofdprogramma_genpy)
add_dependencies(hoofdprogramma_genpy hoofdprogramma_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hoofdprogramma_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hoofdprogramma
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hoofdprogramma_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(hoofdprogramma_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(hoofdprogramma_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hoofdprogramma
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hoofdprogramma_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(hoofdprogramma_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(hoofdprogramma_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hoofdprogramma
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hoofdprogramma_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(hoofdprogramma_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(hoofdprogramma_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hoofdprogramma
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hoofdprogramma_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(hoofdprogramma_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(hoofdprogramma_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hoofdprogramma
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hoofdprogramma_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(hoofdprogramma_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(hoofdprogramma_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
