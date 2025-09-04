cmake_minimum_required(VERSION 3.16)
project(temperatur-sammler)
set(EXECUTABLE_NAME "temp-sam")
include(ExternalProject)
ExternalProject_Add(
    libmodbus
    INSTALL_DIR ${PROJECT_SOURCE_DIR}/external
    GIT_REPOSITORY https://github.com/stephane/libmodbus
    GIT_TAG v3.1.11
    CONFIGURE_COMMAND cd <SOURCE_DIR> && <SOURCE_DIR>/autogen.sh && <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
    BUILD_COMMAND cd <SOURCE_DIR> && make
    INSTALL_COMMAND cd <SOURCE_DIR> && make install
)

add_subdirectory(app)