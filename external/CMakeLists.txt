include(CheckIncludeFile)
check_include_file(sys/socket.h HAVE_SYS_SOCKET_H)
check_include_file(netinet/ip.h HAVE_NETINET_IP_H)
#check_include_file()
#include(CheckFunctionExists)
#check_function_exists(socket HAVE_SOCKET)
#include(CheckSymbolExists)
#check_symbol_exists()

add_library(modbus
    libmodbus/src/modbus.c
    libmodbus/src/modbus-tcp.c
    libmodbus/src/modbus-rtu.c
    libmodbus/src/modbus-data.c)
target_include_directories(modbus
    PRIVATE libmodbus
    PRIVATE libmodbus/src)