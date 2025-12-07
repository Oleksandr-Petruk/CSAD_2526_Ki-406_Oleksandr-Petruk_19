cmake_minimum_required(VERSION 3.10)
project(HelloProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Fetch Google Test
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG main
)
FetchContent_MakeAvailable(googletest)

# Math operations library
add_library(math_ops math_operations.cpp)

# Main executable
add_executable(hello main.cpp)
target_link_libraries(hello PRIVATE math_ops)

# Enable testing
enable_testing()

# Test executable
add_executable(run_tests tests/unit_tests.cpp)
target_link_libraries(run_tests PRIVATE math_ops GTest::gtest_main)

# Register tests
add_test(NAME AllTests COMMAND run_tests)