# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus"
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus-build"
  "/home/nicolas/Git/temperatur-sammler/external"
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/tmp"
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus-stamp"
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src"
  "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/nicolas/Git/temperatur-sammler/build/libmodbus-prefix/src/libmodbus-stamp${cfgdir}") # cfgdir has leading slash
endif()
