cmake_minimum_required(VERSION 3.14)

project(CarDisplay)
find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Sql)
#find_package(Qt6 REQUIRED COMPONENTS QtMultimedia)
add_library(CarDisplay SHARED dashboard.cpp dashboard.h)
target_link_libraries(CarDisplay PRIVATE Qt6::Gui Qt6::Quick)
target_link_libraries(CarDisplay PRIVATE Qt6::Sql)
#target_link_libraries(CarDisplay PRIVATE Qt6::QtMultimedia)
include_directories("${CMAKE_SOURCE_DIR}/CarDB/")


target_link_libraries(CarDisplay PUBLIC CarDB)
