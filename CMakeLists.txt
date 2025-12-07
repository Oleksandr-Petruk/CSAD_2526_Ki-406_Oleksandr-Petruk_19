cmake_minimum_required(VERSION 3.10)
project(HelloProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(MSVC)
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endif()

include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.15.2
)
FetchContent_MakeAvailable(googletest)

# --- Бібліотека ---
add_library(math_ops math_operations.cpp)
target_include_directories(math_ops PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# --- Main ---
add_executable(hello main.cpp)
target_link_libraries(hello PRIVATE math_ops)

# --- Тести ---
enable_testing()

# ЗМІНА: Називаємо ціль "unit_tests_bin", щоб не конфліктувати з "RUN_TESTS"
add_executable(unit_tests_bin tests/unit_tests.cpp)
target_link_libraries(unit_tests_bin PRIVATE math_ops GTest::gtest_main)

# Реєструємо тест
add_test(NAME AllTests COMMAND $<TARGET_FILE:unit_tests_bin>)