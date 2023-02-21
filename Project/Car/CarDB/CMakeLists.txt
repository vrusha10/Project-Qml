cmake_minimum_required(VERSION 3.14)

project(CarDB)
find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Sql)

add_library(CarDB SHARED dashdb.cpp dashdb.h)
target_link_libraries(CarDB PRIVATE Qt6::Gui Qt6::Quick)
target_link_libraries(CarDB PRIVATE Qt6::Sql)

