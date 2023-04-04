cmake_minimum_required (VERSION 3.6)
project (Auto C CXX Fortran)

#enable_language (Fortran)

#################################################################################
#
# global settings
#
#################################################################################

# make sure that the default is a RELEASE
if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE RELEASE CACHE STRING
      "Choose the type of build, options are: None Debug Release."
      FORCE)
endif (NOT CMAKE_BUILD_TYPE)

# default installation
get_filename_component (default_prefix ".." ABSOLUTE)
set (CMAKE_INSTALL_PREFIX ${default_prefix} CACHE STRING
      "Choose the installation directory; by default it installs in the Auto directory."
      FORCE)

# FFLAGS depend on the compiler
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

if (Fortran_COMPILER_NAME MATCHES "gfortran.*")
  # gfortran
  set (CMAKE_Fortran_FLAGS_RELEASE "-funroll-all-loops -fno-f2c -O3")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-fno-f2c -O0 -g")
elseif (Fortran_COMPILER_NAME MATCHES "ifort.*")
  # ifort (untested)
  set (CMAKE_Fortran_FLAGS_RELEASE "-f77rtl -O3")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-f77rtl -O0 -g")
elseif (Fortran_COMPILER_NAME MATCHES "g77")
  # g77
  set (CMAKE_Fortran_FLAGS_RELEASE "-funroll-all-loops -fno-f2c -O3 -m32")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-fno-f2c -O0 -g -m32")
else (Fortran_COMPILER_NAME MATCHES "gfortran.*")
  message ("CMAKE_Fortran_COMPILER full path: " ${CMAKE_Fortran_COMPILER})
  message ("Fortran compiler: " ${Fortran_COMPILER_NAME})
  message ("No optimized Fortran compiler flags are known, we just try -O2...")
  set (CMAKE_Fortran_FLAGS_RELEASE "-O2")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
endif (Fortran_COMPILER_NAME MATCHES "gfortran.*")

SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#################################################################################
#
# add libs/exes/tests ..., etc.
#
#################################################################################


# build executables
#set (NMPROGRAMS "diagstd" "diagrtb" "proj_modes_bin" "pdbmat")
#set (EXECUTABLES "Auto.exe" ${NMPROGRAMS})
#set (SCRIPTS "gen_pert.sh" "pert_multi_mode.sh")

# This is what run() does:
#AUTO> run()
#gcc -O -DPTHREADS -O -I/home/amavisitors/redrod/src/auto/2000/include -c ab.c
#gcc -O ab.o -o ab.exe /home/amavisitors/redrod/src/auto/2000/lib/*.o
#-lpthread -L/home/amavisitors/redrod/src/auto/2000/lib -lauto_f2c -lm
#

#################################################################################
#
# Add auto lib
#
#################################################################################
add_subdirectory(src)


#################################################################################
#
# add demo projects:
#
#################################################################################
add_subdirectory(demos)
#add_subdirectory(demos_c) # linking issues

add_subdirectory(util)
add_subdirectory(plaut)

add_subdirectory(plaut04)

#foreach (p ${NMPROGRAMS})
#  add_executable (${p} "${p}.f")
#endforeach (p)

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")

