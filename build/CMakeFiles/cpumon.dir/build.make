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
CMAKE_SOURCE_DIR = /home/jscha/dvp/cpumon

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jscha/dvp/cpumon/build

# Include any dependencies generated for this target.
include CMakeFiles/cpumon.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/cpumon.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/cpumon.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cpumon.dir/flags.make

CMakeFiles/cpumon.dir/src/main.c.o: CMakeFiles/cpumon.dir/flags.make
CMakeFiles/cpumon.dir/src/main.c.o: ../src/main.c
CMakeFiles/cpumon.dir/src/main.c.o: CMakeFiles/cpumon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cpumon.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cpumon.dir/src/main.c.o -MF CMakeFiles/cpumon.dir/src/main.c.o.d -o CMakeFiles/cpumon.dir/src/main.c.o -c /home/jscha/dvp/cpumon/src/main.c

CMakeFiles/cpumon.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cpumon.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jscha/dvp/cpumon/src/main.c > CMakeFiles/cpumon.dir/src/main.c.i

CMakeFiles/cpumon.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cpumon.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jscha/dvp/cpumon/src/main.c -o CMakeFiles/cpumon.dir/src/main.c.s

CMakeFiles/cpumon.dir/src/cpumonlib.c.o: CMakeFiles/cpumon.dir/flags.make
CMakeFiles/cpumon.dir/src/cpumonlib.c.o: ../src/cpumonlib.c
CMakeFiles/cpumon.dir/src/cpumonlib.c.o: CMakeFiles/cpumon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/cpumon.dir/src/cpumonlib.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cpumon.dir/src/cpumonlib.c.o -MF CMakeFiles/cpumon.dir/src/cpumonlib.c.o.d -o CMakeFiles/cpumon.dir/src/cpumonlib.c.o -c /home/jscha/dvp/cpumon/src/cpumonlib.c

CMakeFiles/cpumon.dir/src/cpumonlib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cpumon.dir/src/cpumonlib.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jscha/dvp/cpumon/src/cpumonlib.c > CMakeFiles/cpumon.dir/src/cpumonlib.c.i

CMakeFiles/cpumon.dir/src/cpumonlib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cpumon.dir/src/cpumonlib.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jscha/dvp/cpumon/src/cpumonlib.c -o CMakeFiles/cpumon.dir/src/cpumonlib.c.s

CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o: CMakeFiles/cpumon.dir/flags.make
CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o: ../src/machine_specific_registers.c
CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o: CMakeFiles/cpumon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o -MF CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o.d -o CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o -c /home/jscha/dvp/cpumon/src/machine_specific_registers.c

CMakeFiles/cpumon.dir/src/machine_specific_registers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cpumon.dir/src/machine_specific_registers.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jscha/dvp/cpumon/src/machine_specific_registers.c > CMakeFiles/cpumon.dir/src/machine_specific_registers.c.i

CMakeFiles/cpumon.dir/src/machine_specific_registers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cpumon.dir/src/machine_specific_registers.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jscha/dvp/cpumon/src/machine_specific_registers.c -o CMakeFiles/cpumon.dir/src/machine_specific_registers.c.s

CMakeFiles/cpumon.dir/src/sysfs.c.o: CMakeFiles/cpumon.dir/flags.make
CMakeFiles/cpumon.dir/src/sysfs.c.o: ../src/sysfs.c
CMakeFiles/cpumon.dir/src/sysfs.c.o: CMakeFiles/cpumon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/cpumon.dir/src/sysfs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cpumon.dir/src/sysfs.c.o -MF CMakeFiles/cpumon.dir/src/sysfs.c.o.d -o CMakeFiles/cpumon.dir/src/sysfs.c.o -c /home/jscha/dvp/cpumon/src/sysfs.c

CMakeFiles/cpumon.dir/src/sysfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cpumon.dir/src/sysfs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jscha/dvp/cpumon/src/sysfs.c > CMakeFiles/cpumon.dir/src/sysfs.c.i

CMakeFiles/cpumon.dir/src/sysfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cpumon.dir/src/sysfs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jscha/dvp/cpumon/src/sysfs.c -o CMakeFiles/cpumon.dir/src/sysfs.c.s

CMakeFiles/cpumon.dir/src/guilib.c.o: CMakeFiles/cpumon.dir/flags.make
CMakeFiles/cpumon.dir/src/guilib.c.o: ../src/guilib.c
CMakeFiles/cpumon.dir/src/guilib.c.o: CMakeFiles/cpumon.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/cpumon.dir/src/guilib.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cpumon.dir/src/guilib.c.o -MF CMakeFiles/cpumon.dir/src/guilib.c.o.d -o CMakeFiles/cpumon.dir/src/guilib.c.o -c /home/jscha/dvp/cpumon/src/guilib.c

CMakeFiles/cpumon.dir/src/guilib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cpumon.dir/src/guilib.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jscha/dvp/cpumon/src/guilib.c > CMakeFiles/cpumon.dir/src/guilib.c.i

CMakeFiles/cpumon.dir/src/guilib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cpumon.dir/src/guilib.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jscha/dvp/cpumon/src/guilib.c -o CMakeFiles/cpumon.dir/src/guilib.c.s

# Object files for target cpumon
cpumon_OBJECTS = \
"CMakeFiles/cpumon.dir/src/main.c.o" \
"CMakeFiles/cpumon.dir/src/cpumonlib.c.o" \
"CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o" \
"CMakeFiles/cpumon.dir/src/sysfs.c.o" \
"CMakeFiles/cpumon.dir/src/guilib.c.o"

# External object files for target cpumon
cpumon_EXTERNAL_OBJECTS =

../bin/cpumon: CMakeFiles/cpumon.dir/src/main.c.o
../bin/cpumon: CMakeFiles/cpumon.dir/src/cpumonlib.c.o
../bin/cpumon: CMakeFiles/cpumon.dir/src/machine_specific_registers.c.o
../bin/cpumon: CMakeFiles/cpumon.dir/src/sysfs.c.o
../bin/cpumon: CMakeFiles/cpumon.dir/src/guilib.c.o
../bin/cpumon: CMakeFiles/cpumon.dir/build.make
../bin/cpumon: CMakeFiles/cpumon.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jscha/dvp/cpumon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable ../bin/cpumon"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cpumon.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cpumon.dir/build: ../bin/cpumon
.PHONY : CMakeFiles/cpumon.dir/build

CMakeFiles/cpumon.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cpumon.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cpumon.dir/clean

CMakeFiles/cpumon.dir/depend:
	cd /home/jscha/dvp/cpumon/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jscha/dvp/cpumon /home/jscha/dvp/cpumon /home/jscha/dvp/cpumon/build /home/jscha/dvp/cpumon/build /home/jscha/dvp/cpumon/build/CMakeFiles/cpumon.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cpumon.dir/depend

