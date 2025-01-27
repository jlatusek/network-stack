cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    network-stack
    VERSION 0.1.0
    DESCRIPTION "Simple netwok stack implementation"
    HOMEPAGE_URL "https://github.com/jlatusek/network-stack"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_compile_options(-fdiagnostics-color=always) # force ninja to show colors

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    network-stack_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    network-stack_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

# ---- Declare executable ----

add_executable(network-stack_exe source/main.cpp)

set_property(TARGET network-stack_exe PROPERTY OUTPUT_NAME network-stack)

target_link_libraries(network-stack_exe PRIVATE network-stack_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT network-stack_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of network-stack"
  )
endif()

include(cmake/dev-mode.cmake)
