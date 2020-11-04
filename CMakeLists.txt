cmake_minimum_required(VERSION 3.12...3.18)

project(executable)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
find_package(Existing REQUIRED)

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME} PRIVATE main.cpp)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Existing::Existing
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        SKIP_BUILD_RPATH    On
)