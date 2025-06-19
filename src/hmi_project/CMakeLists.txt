cmake_minimum_required(VERSION 3.0.2)
project(hmi_project)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  trajectory_msgs
)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## Uncomment and add message/service/action files if needed
# add_message_files(
#   FILES
#   Example.msg
# )
# add_service_files(
#   FILES
#   Example.srv
# )
# add_action_files(
#   FILES
#   Example.action
# )
# generate_messages(
#   DEPENDENCIES std_msgs trajectory_msgs
# )

###################################
## catkin specific configuration ##
###################################
catkin_package(
  CATKIN_DEPENDS rospy std_msgs trajectory_msgs
)

###########
## Build ##
###########

include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Uncomment to add C++ executables or libraries if nodig
# add_executable(${PROJECT_NAME}_node src/hmi_project_node.cpp)
# target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

#############
## Install ##
#############

## Voor Python scripts, zet dit aan en pas de bestandsnamen aan
# catkin_install_python(PROGRAMS
#   scripts/hmi_controller.py
#   scripts/robot_controller.py
#   scripts/status_responder.py
#   scripts/hmi_gui.py
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )


