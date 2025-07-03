cmake_minimum_required(VERSION 3.0.2)
project(my_services)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  sensor_msgs
  message_generation
)

add_service_files(
  FILES
  Detectie.srv
  Lokaliseren.srv
  Omrekenen.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime rospy std_msgs sensor_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

