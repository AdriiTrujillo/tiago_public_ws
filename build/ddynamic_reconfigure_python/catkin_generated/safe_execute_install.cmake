execute_process(COMMAND "/home/adrii/tiago_public_ws/build/ddynamic_reconfigure_python/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/adrii/tiago_public_ws/build/ddynamic_reconfigure_python/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
