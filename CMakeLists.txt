cmake_minimum_required(VERSION 3.15)
project(cback)
add_executable(server server.cpp)
add_executable(client client.cpp)

set(CMAKE_CXX_STANDARD 17)

# Find Package

find_package(Boost REQUIRED COMPONENTS system thread)
if (NOT Boost_FOUND)
	SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "/home/ilia/Documents/Dependencies/boost_1_79_0")
	SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "/home/ilia/Documents/Dependencies/boost_1_79_0/stage/lib")
find_package(Boost REQUIRED COMPONENTS system thread)
endif()

include_directories(${Boost_INCLUDE_DIR})
target_link_libraries(server ${Boost_LIBRARIES})
target_link_libraries(client ${Boost_LIBRARIES})

find_package( OpenCV REQUIRED PATHS /home/ilia/Documents/Dependencies/opencv/build )

if( OpenCV_FOUND )
  include_directories( ${OpenCV_INCLUDE_DIRS} )

  link_directories( ${OpenCV_LIB_DIR} )

  target_link_libraries( server ${OpenCV_LIBS} )
  target_link_libraries( client ${OpenCV_LIBS} )
endif()
