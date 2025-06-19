# Install script for directory: /home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/student/Git-projects/robot_project/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE PROGRAM FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE PROGRAM FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/setup.bash;/home/student/Git-projects/robot_project/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/setup.bash"
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/setup.sh;/home/student/Git-projects/robot_project/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/setup.sh"
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/setup.zsh;/home/student/Git-projects/robot_project/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/setup.zsh"
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/student/Git-projects/robot_project/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/student/Git-projects/robot_project/install" TYPE FILE FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs/msg" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/msg/RobotMsg.msg"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/msg/IOState.msg"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/msg/CIOState.msg"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/msg/VeloMoveMsg.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs/srv" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/Move.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetAxis.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetInt16.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/TCPOffset.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetDigitalIO.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetDigitalIO.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetAnalogIO.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/ClearErr.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetErr.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GripperConfig.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GripperMove.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GripperState.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetLoad.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetToolModbus.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/ConfigToolModbus.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetControllerDigitalIO.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetControllerAnalogIO.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/MoveAxisAngle.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/MoveVelo.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/MoveVelocity.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetFloat32.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetMultipleInts.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetString.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/PlayTraj.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetFloat32List.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetInt32.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/SetModbusTimeout.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/GetSetModbusData.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/Call.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/FtCaliLoad.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/FtIdenLoad.srv"
    "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/srv/VacuumGripperCtrl.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs/cmake" TYPE FILE FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/xarm_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/include/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/share/roseus/ros/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/share/common-lisp/ros/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/share/gennodejs/ros/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/lib/python2.7/dist-packages/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/student/Git-projects/robot_project/devel/.private/xarm_msgs/lib/python2.7/dist-packages/xarm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/xarm_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs/cmake" TYPE FILE FILES "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/xarm_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs/cmake" TYPE FILE FILES
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/xarm_msgsConfig.cmake"
    "/home/student/Git-projects/robot_project/build/xarm_msgs/catkin_generated/installspace/xarm_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_msgs" TYPE FILE FILES "/home/student/Git-projects/robot_project/src/xarm_ros/xarm_msgs/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/student/Git-projects/robot_project/build/xarm_msgs/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/student/Git-projects/robot_project/build/xarm_msgs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
