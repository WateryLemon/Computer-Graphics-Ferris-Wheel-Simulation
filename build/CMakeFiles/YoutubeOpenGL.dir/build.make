# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/julestournier/Documents/Projects/OpenGL Template"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/julestournier/Documents/Projects/OpenGL Template/build"

# Include any dependencies generated for this target.
include CMakeFiles/YoutubeOpenGL.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/YoutubeOpenGL.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/YoutubeOpenGL.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/YoutubeOpenGL.dir/flags.make

CMakeFiles/YoutubeOpenGL.dir/codegen:
.PHONY : CMakeFiles/YoutubeOpenGL.dir/codegen

CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/Main.cpp
CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/Main.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/Main.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/Main.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/glad.c
CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o -MF CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/glad.c"

CMakeFiles/YoutubeOpenGL.dir/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/YoutubeOpenGL.dir/src/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/glad.c" > CMakeFiles/YoutubeOpenGL.dir/src/glad.c.i

CMakeFiles/YoutubeOpenGL.dir/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/YoutubeOpenGL.dir/src/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/glad.c" -o CMakeFiles/YoutubeOpenGL.dir/src/glad.c.s

CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/VAO.cpp
CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/VAO.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/VAO.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/VAO.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/VBO.cpp
CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/VBO.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/VBO.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/VBO.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/EBO.cpp
CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/EBO.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/EBO.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/EBO.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/shaderClass.cpp
CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/shaderClass.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/shaderClass.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/shaderClass.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/Camera.cpp
CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/Camera.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/Camera.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/Camera.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/Texture.cpp
CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/Texture.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/Texture.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/Texture.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/Mesh.cpp
CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/Mesh.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/Mesh.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/Mesh.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.s

CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o: CMakeFiles/YoutubeOpenGL.dir/flags.make
CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o: /Users/julestournier/Documents/Projects/OpenGL\ Template/src/stb.cpp
CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o: CMakeFiles/YoutubeOpenGL.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o -MF CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o.d -o CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o -c "/Users/julestournier/Documents/Projects/OpenGL Template/src/stb.cpp"

CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/julestournier/Documents/Projects/OpenGL Template/src/stb.cpp" > CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.i

CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/julestournier/Documents/Projects/OpenGL Template/src/stb.cpp" -o CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.s

# Object files for target YoutubeOpenGL
YoutubeOpenGL_OBJECTS = \
"CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o" \
"CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o"

# External object files for target YoutubeOpenGL
YoutubeOpenGL_EXTERNAL_OBJECTS =

YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/Main.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/glad.c.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/VAO.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/VBO.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/EBO.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/shaderClass.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/Camera.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/Texture.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/Mesh.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/src/stb.cpp.o
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/build.make
YoutubeOpenGL: /opt/homebrew/lib/libglfw.3.4.dylib
YoutubeOpenGL: /Library/Developer/CommandLineTools/SDKs/MacOSX14.5.sdk/System/Library/Frameworks/OpenGL.framework
YoutubeOpenGL: CMakeFiles/YoutubeOpenGL.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable YoutubeOpenGL"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/YoutubeOpenGL.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/YoutubeOpenGL.dir/build: YoutubeOpenGL
.PHONY : CMakeFiles/YoutubeOpenGL.dir/build

CMakeFiles/YoutubeOpenGL.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/YoutubeOpenGL.dir/cmake_clean.cmake
.PHONY : CMakeFiles/YoutubeOpenGL.dir/clean

CMakeFiles/YoutubeOpenGL.dir/depend:
	cd "/Users/julestournier/Documents/Projects/OpenGL Template/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/julestournier/Documents/Projects/OpenGL Template" "/Users/julestournier/Documents/Projects/OpenGL Template" "/Users/julestournier/Documents/Projects/OpenGL Template/build" "/Users/julestournier/Documents/Projects/OpenGL Template/build" "/Users/julestournier/Documents/Projects/OpenGL Template/build/CMakeFiles/YoutubeOpenGL.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/YoutubeOpenGL.dir/depend

