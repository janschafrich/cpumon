cmake_minimum_required(VERSION 3.0)
project(cpumon C)

# Compiler flags for debugging
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -ggdb3 -gdwarf-2 -masm=intel -fverbose-asm -fdiagnostics-color=always -Wall")

# Compiler flags for optimization
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")

# Include directories
include_directories(include)

# Source files
set(SOURCES src/main.c src/cpumonlib.c src/guilib.c)

# Add executable
add_executable(cpumon ${SOURCES})

# Link libraries
target_link_libraries(cpumon m ncurses)

# Set output directory for the executable
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# Set output directory for object files
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)
