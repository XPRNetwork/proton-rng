# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.4/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jafri/eosio.evm/eosio.evm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jafri/eosio.evm/eosio.evm

# Include any dependencies generated for this target.
include tests/CMakeFiles/evm_test.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/evm_test.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/evm_test.dir/flags.make

tests/CMakeFiles/evm_test.dir/evm_test.cpp.obj: tests/CMakeFiles/evm_test.dir/flags.make
tests/CMakeFiles/evm_test.dir/evm_test.cpp.obj: tests/evm_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/evm_test.dir/evm_test.cpp.obj"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/evm_test.dir/evm_test.cpp.obj -c /Users/jafri/eosio.evm/eosio.evm/tests/evm_test.cpp

tests/CMakeFiles/evm_test.dir/evm_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/evm_test.dir/evm_test.cpp.i"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jafri/eosio.evm/eosio.evm/tests/evm_test.cpp > CMakeFiles/evm_test.dir/evm_test.cpp.i

tests/CMakeFiles/evm_test.dir/evm_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/evm_test.dir/evm_test.cpp.s"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jafri/eosio.evm/eosio.evm/tests/evm_test.cpp -o CMakeFiles/evm_test.dir/evm_test.cpp.s

tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj: tests/CMakeFiles/evm_test.dir/flags.make
tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj: src/eosio.evm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj -c /Users/jafri/eosio.evm/eosio.evm/src/eosio.evm.cpp

tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.i"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jafri/eosio.evm/eosio.evm/src/eosio.evm.cpp > CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.i

tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.s"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jafri/eosio.evm/eosio.evm/src/eosio.evm.cpp -o CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.s

tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.obj: tests/CMakeFiles/evm_test.dir/flags.make
tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.obj: src/processor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.obj"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/evm_test.dir/__/src/processor.cpp.obj -c /Users/jafri/eosio.evm/eosio.evm/src/processor.cpp

tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/evm_test.dir/__/src/processor.cpp.i"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jafri/eosio.evm/eosio.evm/src/processor.cpp > CMakeFiles/evm_test.dir/__/src/processor.cpp.i

tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/evm_test.dir/__/src/processor.cpp.s"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jafri/eosio.evm/eosio.evm/src/processor.cpp -o CMakeFiles/evm_test.dir/__/src/processor.cpp.s

tests/CMakeFiles/evm_test.dir/__/src/state.cpp.obj: tests/CMakeFiles/evm_test.dir/flags.make
tests/CMakeFiles/evm_test.dir/__/src/state.cpp.obj: src/state.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object tests/CMakeFiles/evm_test.dir/__/src/state.cpp.obj"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/evm_test.dir/__/src/state.cpp.obj -c /Users/jafri/eosio.evm/eosio.evm/src/state.cpp

tests/CMakeFiles/evm_test.dir/__/src/state.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/evm_test.dir/__/src/state.cpp.i"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jafri/eosio.evm/eosio.evm/src/state.cpp > CMakeFiles/evm_test.dir/__/src/state.cpp.i

tests/CMakeFiles/evm_test.dir/__/src/state.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/evm_test.dir/__/src/state.cpp.s"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jafri/eosio.evm/eosio.evm/src/state.cpp -o CMakeFiles/evm_test.dir/__/src/state.cpp.s

tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj: tests/CMakeFiles/evm_test.dir/flags.make
tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj: src/transfer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj -c /Users/jafri/eosio.evm/eosio.evm/src/transfer.cpp

tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/evm_test.dir/__/src/transfer.cpp.i"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jafri/eosio.evm/eosio.evm/src/transfer.cpp > CMakeFiles/evm_test.dir/__/src/transfer.cpp.i

tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/evm_test.dir/__/src/transfer.cpp.s"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && /Users/jafri/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jafri/eosio.evm/eosio.evm/src/transfer.cpp -o CMakeFiles/evm_test.dir/__/src/transfer.cpp.s

# Object files for target evm_test
evm_test_OBJECTS = \
"CMakeFiles/evm_test.dir/evm_test.cpp.obj" \
"CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj" \
"CMakeFiles/evm_test.dir/__/src/processor.cpp.obj" \
"CMakeFiles/evm_test.dir/__/src/state.cpp.obj" \
"CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj"

# External object files for target evm_test
evm_test_EXTERNAL_OBJECTS =

tests/evm_test: tests/CMakeFiles/evm_test.dir/evm_test.cpp.obj
tests/evm_test: tests/CMakeFiles/evm_test.dir/__/src/eosio.evm.cpp.obj
tests/evm_test: tests/CMakeFiles/evm_test.dir/__/src/processor.cpp.obj
tests/evm_test: tests/CMakeFiles/evm_test.dir/__/src/state.cpp.obj
tests/evm_test: tests/CMakeFiles/evm_test.dir/__/src/transfer.cpp.obj
tests/evm_test: tests/CMakeFiles/evm_test.dir/build.make
tests/evm_test: tests/CMakeFiles/evm_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jafri/eosio.evm/eosio.evm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable evm_test"
	cd /Users/jafri/eosio.evm/eosio.evm/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/evm_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/evm_test.dir/build: tests/evm_test

.PHONY : tests/CMakeFiles/evm_test.dir/build

tests/CMakeFiles/evm_test.dir/clean:
	cd /Users/jafri/eosio.evm/eosio.evm/tests && $(CMAKE_COMMAND) -P CMakeFiles/evm_test.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/evm_test.dir/clean

tests/CMakeFiles/evm_test.dir/depend:
	cd /Users/jafri/eosio.evm/eosio.evm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jafri/eosio.evm/eosio.evm /Users/jafri/eosio.evm/eosio.evm/tests /Users/jafri/eosio.evm/eosio.evm /Users/jafri/eosio.evm/eosio.evm/tests /Users/jafri/eosio.evm/eosio.evm/tests/CMakeFiles/evm_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/evm_test.dir/depend
