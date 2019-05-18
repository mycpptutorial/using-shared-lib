cmake_minimum_required(VERSION 2.8.12)
project(DatetimeUtilSharedLib)

set(HEADER_SEARCH_PATH "./include")

include_directories(${HEADER_SEARCH_PATH})

add_executable(main main.cpp)

find_library(DATETIMELIB_LIBRARY NAMES datetimeutil)
add_library(datetimeutil UNKNOWN IMPORTED)
set_property(TARGET datetimeutil PROPERTY IMPORTED_LOCATION "${DATETIMELIB_LIBRARY}")

target_link_libraries(main datetimeutil)
