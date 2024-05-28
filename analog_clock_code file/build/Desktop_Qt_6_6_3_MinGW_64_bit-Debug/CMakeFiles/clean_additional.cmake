# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appanalog_clock_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appanalog_clock_autogen.dir\\ParseCache.txt"
  "appanalog_clock_autogen"
  )
endif()
