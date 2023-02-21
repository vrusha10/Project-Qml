cmake_minimum_required(VERSION 3.14)

project(Car VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
#find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS QtMultimedia)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick)
#find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS QtMultimedia)
add_subdirectory(CarDisplay/)
add_subdirectory(CarDB/)
set(PROJECT_SOURCES
        main.cpp
        qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(Car
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET Car APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(Car SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(Car
          ${PROJECT_SOURCES}
        )
    endif()
endif()
find_package(Qt6 REQUIRED COMPONENTS Sql)
#find_package(Qt6  REQUIRED COMPONENTS Multimedia)
#find_package(QtMultimedia)
#find_package(Qt6 REQUIRED COMPONENTS QtMultimedia)
target_link_libraries(Car PRIVATE Qt6::Sql)
#target_link_libraries(Car PRIVATE QtMultimedia)
#target_link_libraries(Car PRIVATE Qt6::QtMultimedia)
target_link_libraries(Car
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)
target_link_directories(Car PUBLIC CarDisplay/)
target_link_libraries(Car PUBLIC CarDisplay)
target_link_directories(Car PUBLIC CarDB/)
target_link_libraries(Car PUBLIC CarDB)
set_target_properties(Car PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS Car
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(Car)
    qt_finalize_executable(Car)
endif()
