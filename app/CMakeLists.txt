set(EXE_SOURCES
    main.cc)
set(EXE_INCLUDES
    "./"
    ${PROJECT_SOURCE_DIR}/external/libmodbus/src
    ${PROJECT_BINARY_DIR}/configured)

add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES})

target_include_directories(${EXECUTABLE_NAME} PUBLIC
    ${EXE_INCLUDES})

target_link_libraries(${EXECUTABLE_NAME} PUBLIC
    modbus
    spdlog::spdlog)
