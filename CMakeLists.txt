cmake_minimum_required(VERSION 3.22)

project(Temperatur-Sammler VERSION 1.0.0 LANGUAGES C CXX)

set(EXECUTABLE_NAME "ts")

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmodule)
include(FetchContent)

# Externe Projekte ohne CMake Unterstützung
add_git_submodule(external/libmodbus)

# Externe Projekte mit CMake Unterstützung
FetchContent_Declare(
	spdlog
	GIT_REPOSITORY https://github.com/gabime/spdlog
	GIT_TAG v1.11.0
	GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(spdlog)

add_subdirectory(configured)
add_subdirectory(external)
add_subdirectory(app)
