include_guard()

set(OPENCV_MINIMUM_VERSION 4.4.0)
set(OPENCV_COMPONENTS core imgproc highgui)

if (DEFINED ENV{OpenCV_DIR} AND NOT OpenCV_DIR)
    set(OpenCV_DIR $ENV{OpenCV_DIR})
endif()

message("OpenCV_DIR = ${OpenCV_DIR}")

if(OpenCV_DIR) # Для стандартной стурктуры папок

    find_package(OpenCV ${OPENCV_MINIMUM_VERSION} REQUIRED COMPONENTS ${OPENCV_COMPONENTS})

endif()


if(NOT OpenCV_FOUND)
    message(FATAL_ERROR "Could not find OpenCV. Check OpenCV_DIR variable!")
endif()

include_directories(${OpenCV_INCLUDE_DIRS})