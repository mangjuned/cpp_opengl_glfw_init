cmake_minimum_required(VERSION 3.10)

project(MyGLFWProject)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the path to your dependencies folder
set(DEPENDENCIES_DIR ${CMAKE_SOURCE_DIR}/Dependencies)

# Find OpenGL package
find_package(OpenGL REQUIRED)


# Create a static library for GLAD with warnings disabled
add_library(glad STATIC
    ${DEPENDENCIES_DIR}/GLAD/src/glad.c
)

target_include_directories(glad PRIVATE
    ${DEPENDENCIES_DIR}/GLAD/include
)

# Disable warnings for GLAD library
target_compile_options(glad PRIVATE
    -w  # Disable all warnings for GLAD
)

# Add executable
add_executable(${PROJECT_NAME} src/main.cpp)

# Add compiler warning flags using target_compile_options
target_compile_options(${PROJECT_NAME} PRIVATE
    -Wall
    -Weffc++
    -Wextra
    -Wconversion
    -Wsign-conversion
    -Werror
)


# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${DEPENDENCIES_DIR}
    ${DEPENDENCIES_DIR}/GLAD/include  # Add GLAD include path
)

# Link static GLFW library
target_link_libraries(${PROJECT_NAME} PRIVATE
    glad
    ${DEPENDENCIES_DIR}/GLFW/libglfw3.a
    OpenGL::GL
    gdi32
)

# Set the output directory for the executable
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)