# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adrii/tiago_public_ws/src/aruco_ros/aruco

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adrii/tiago_public_ws/build/aruco

# Include any dependencies generated for this target.
include CMakeFiles/optimalmarkers.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/optimalmarkers.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/optimalmarkers.dir/flags.make

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o: CMakeFiles/optimalmarkers.dir/flags.make
CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o: /home/adrii/tiago_public_ws/src/aruco_ros/aruco/src/aruco/aruco_selectoptimalmarkers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/adrii/tiago_public_ws/build/aruco/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o -c /home/adrii/tiago_public_ws/src/aruco_ros/aruco/src/aruco/aruco_selectoptimalmarkers.cpp

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/adrii/tiago_public_ws/src/aruco_ros/aruco/src/aruco/aruco_selectoptimalmarkers.cpp > CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.i

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/adrii/tiago_public_ws/src/aruco_ros/aruco/src/aruco/aruco_selectoptimalmarkers.cpp -o CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.s

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.requires:

.PHONY : CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.requires

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.provides: CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.requires
	$(MAKE) -f CMakeFiles/optimalmarkers.dir/build.make CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.provides.build
.PHONY : CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.provides

CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.provides.build: CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o


# Object files for target optimalmarkers
optimalmarkers_OBJECTS = \
"CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o"

# External object files for target optimalmarkers
optimalmarkers_EXTERNAL_OBJECTS =

/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: CMakeFiles/optimalmarkers.dir/build.make
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /home/adrii/tiago_public_ws/devel/.private/aruco/lib/libaruco.so
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stitching3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_superres3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videostab3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_aruco3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bgsegm3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bioinspired3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ccalib3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_cvv3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dpm3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_face3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_photo3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_fuzzy3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_hdf3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_img_hash3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_line_descriptor3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_optflow3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_reg3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_rgbd3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_saliency3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stereo3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_structured_light3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_viz3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_phase_unwrapping3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_surface_matching3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_tracking3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_datasets3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_plot3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_text3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dnn3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xfeatures2d3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ml3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_shape3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_video3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ximgproc3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_calib3d3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_features2d3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_flann3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_highgui3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videoio3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xobjdetect3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_objdetect3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xphoto3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers: CMakeFiles/optimalmarkers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/adrii/tiago_public_ws/build/aruco/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optimalmarkers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/optimalmarkers.dir/build: /home/adrii/tiago_public_ws/devel/.private/aruco/lib/aruco/optimalmarkers

.PHONY : CMakeFiles/optimalmarkers.dir/build

CMakeFiles/optimalmarkers.dir/requires: CMakeFiles/optimalmarkers.dir/src/aruco/aruco_selectoptimalmarkers.cpp.o.requires

.PHONY : CMakeFiles/optimalmarkers.dir/requires

CMakeFiles/optimalmarkers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/optimalmarkers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/optimalmarkers.dir/clean

CMakeFiles/optimalmarkers.dir/depend:
	cd /home/adrii/tiago_public_ws/build/aruco && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adrii/tiago_public_ws/src/aruco_ros/aruco /home/adrii/tiago_public_ws/src/aruco_ros/aruco /home/adrii/tiago_public_ws/build/aruco /home/adrii/tiago_public_ws/build/aruco /home/adrii/tiago_public_ws/build/aruco/CMakeFiles/optimalmarkers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/optimalmarkers.dir/depend

