cmake_minimum_required(VERSION 3.16)
project(QuickshellStateModule VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

# Suppress Qt policy warning QTP0001
if(POLICY QTP0001)
    cmake_policy(SET QTP0001 NEW)
endif()

find_package(Qt6 REQUIRED COMPONENTS Core Qml Quick)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Iris")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Iris")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Iris")

qt_add_qml_module(state_module
    URI "Iris"
    VERSION 1.0
    SOURCES
        src/Iris/Launcher.h
        src/Iris/Launcher.cpp
        src/Iris/State.h
        src/Iris/State.cpp
)

target_include_directories(state_module PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src/Iris)
set_target_properties(state_moduleplugin PROPERTIES INSTALL_RPATH "$ORIGIN")

target_link_libraries(state_module PRIVATE
    Qt6::Core
    Qt6::Qml
    Qt6::Quick
)

include(GNUInstallDirs)
set(INSTALL_QMLDIR "${CMAKE_INSTALL_LIBDIR}/qt6/qml" CACHE PATH "Installation directory for QML modules")

install(TARGETS state_module state_moduleplugin
    DESTINATION "${INSTALL_QMLDIR}/Iris"
)

install(FILES 
    "${CMAKE_BINARY_DIR}/qmldir"
    "${CMAKE_BINARY_DIR}/state_module.qmltypes"
    DESTINATION "${INSTALL_QMLDIR}/Iris"
)