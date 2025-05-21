cmake_minimum_required(VERSION 4.0.0)
project(hello_world VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(glfw3  REQUIRED)
find_package(OpenGL REQUIRED)

add_executable(helloWorld
    src/Main.cpp
    src/glad.c
    src/VAO.cpp
    src/VBO.cpp
    src/EBO.cpp
    src/shaderClass.cpp
    src/Camera.cpp
    src/Texture.cpp
    src/Mesh.cpp
    src/stb.cpp
)


target_include_directories(helloWorld PRIVATE ${PROJECT_SOURCE_DIR}/dependencies)

target_link_libraries(helloWorld glfw OpenGL::GL)