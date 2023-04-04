cmake_minimum_required(VERSION 3.13.0)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# OK with:
#
#
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# TODO: unfinished
set (PLAUT04_FSRC_FILES
    axis.c++
    bifurcation.c++
    createCoords.c++
    createDisk.c++
    createBoundingBox.c++
    createLegend.c++
    createSphere.c++
    printToPS.c++
    polygon3d.c++
    readFM.c++
    rounding.c++
    solution.c++
    stringtrim.c++
    tube.c++
    gmainqt.c++ # qt mainwindow
)
INCLUDE_DIRECTORIES("/path/to/qt/include")
INCLUDE_DIRECTORIES("/path/to/qt/include/QtCore")
INCLUDE_DIRECTORIES("/path/to/qt/include/QtWidgets")
INCLUDE_DIRECTORIES("/path/to/qt/include/QtGui")
INCLUDE_DIRECTORIES("../includes")
INCLUDE_DIRECTORIES("/path/to/coin3d/include")

add_library(plaut04 ${PLAUT04_FSRC_FILES})
set_property(TARGET plaut04 PROPERTY POSITION_INDEPENDENT_CODE ON)
add_library(auto::plaut04 ALIAS plaut04)

add_library(plaut04_r3b
   r3b/createLibPoint.c++
   r3b/createPrimary.c++
   r3b/toInertialFrame.c++
   r3b/gmainr3b.c++
  # resources.qrc
)
add_library(auto::plaut04_r3b ALIAS plaut04_r3b)

add_executable(plaut04.exe gmain.c++)  # gmain.c++ the main()
target_link_libraries(plaut04.exe
  PRIVATE
    plaut04
    Qt5::Widgets
    # COIN3D LIBS
)