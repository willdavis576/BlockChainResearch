# Install script for directory: /home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/pi/blockChainGit/00blockChain_ws/install")
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

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_/msg" TYPE FILE FILES
    "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/blockDetail.msg"
    "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/lastHash.msg"
    "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/rewriteNode.msg"
    "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/finish.msg"
    "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/sim.msg"
<<<<<<< HEAD
=======
=======
if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_/msg" TYPE FILE FILES
    "/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/blockDetail.msg"
    "/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/lastHash.msg"
    "/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/rewriteNode.msg"
    "/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/finish.msg"
    "/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg/sim.msg"
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_/cmake" TYPE FILE FILES "/home/pi/blockChainGit/00blockChain_ws/build/blockChainPack_/catkin_generated/installspace/blockChainPack_-msg-paths.cmake")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/pi/blockChainGit/00blockChain_ws/devel/include/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/pi/blockChainGit/00blockChain_ws/devel/share/roseus/ros/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/pi/blockChainGit/00blockChain_ws/devel/share/common-lisp/ros/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/pi/blockChainGit/00blockChain_ws/devel/share/gennodejs/ros/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/pi/blockChainGit/00blockChain_ws/devel/lib/python2.7/dist-packages/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/pi/blockChainGit/00blockChain_ws/devel/lib/python2.7/dist-packages/blockChainPack_")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/blockChainGit/00blockChain_ws/build/blockChainPack_/catkin_generated/installspace/blockChainPack_.pc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_/cmake" TYPE FILE FILES "/home/pi/blockChainGit/00blockChain_ws/build/blockChainPack_/catkin_generated/installspace/blockChainPack_-msg-extras.cmake")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_/cmake" TYPE FILE FILES
    "/home/pi/blockChainGit/00blockChain_ws/build/blockChainPack_/catkin_generated/installspace/blockChainPack_Config.cmake"
    "/home/pi/blockChainGit/00blockChain_ws/build/blockChainPack_/catkin_generated/installspace/blockChainPack_Config-version.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockChainPack_" TYPE FILE FILES "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/package.xml")
endif()

