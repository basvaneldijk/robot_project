cmake_minimum_required(VERSION 3.0.2)
project(hoofdprogramma)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  geometry_msgs
  actionlib
  actionlib_msgs
  message_generation
)

add_message_files(
  FILES
  KwastDetection.msg
)

add_action_files(
  FILES
  PickAndPlace.action
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  actionlib_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime std_msgs geometry_msgs actionlib_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  scripts/hoofdprogramma_node.py
  scripts/pick_and_place_server.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
