# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/multithreaded_merge_sort.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/multithreaded_merge_sort.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/multithreaded_merge_sort.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/multithreaded_merge_sort.dir/flags.make

CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o: CMakeFiles/multithreaded_merge_sort.dir/flags.make
CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o: ../multithreadedMergesort.cpp
CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o: CMakeFiles/multithreaded_merge_sort.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o -MF CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o.d -o CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o -c "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/multithreadedMergesort.cpp"

CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/multithreadedMergesort.cpp" > CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.i

CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/multithreadedMergesort.cpp" -o CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.s

# Object files for target multithreaded_merge_sort
multithreaded_merge_sort_OBJECTS = \
"CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o"

# External object files for target multithreaded_merge_sort
multithreaded_merge_sort_EXTERNAL_OBJECTS =

multithreaded_merge_sort: CMakeFiles/multithreaded_merge_sort.dir/multithreadedMergesort.cpp.o
multithreaded_merge_sort: CMakeFiles/multithreaded_merge_sort.dir/build.make
multithreaded_merge_sort: CMakeFiles/multithreaded_merge_sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable multithreaded_merge_sort"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multithreaded_merge_sort.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/multithreaded_merge_sort.dir/build: multithreaded_merge_sort
.PHONY : CMakeFiles/multithreaded_merge_sort.dir/build

CMakeFiles/multithreaded_merge_sort.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/multithreaded_merge_sort.dir/cmake_clean.cmake
.PHONY : CMakeFiles/multithreaded_merge_sort.dir/clean

CMakeFiles/multithreaded_merge_sort.dir/depend:
	cd "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort" "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort" "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug" "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug" "/mnt/c/Users/Asus/Desktop/multithreading/multithreaded merge sort/cmake-build-debug/CMakeFiles/multithreaded_merge_sort.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/multithreaded_merge_sort.dir/depend
