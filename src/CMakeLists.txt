#############################################
#
# AUTO Lib
#
#############################################

#[[ ALL FILES:
  blas.f
  lapack.f
  ae.f90
  auto_constants.f90
  bvp.f90
  f2003.f90
  equilibrium.f90
  f2003.f90
  floquet.f90
  homcont.f90
  interfaces.f90
  io.f90
  main.f90  ###
  maps.f90
  mesh.f90
  optimization.f90
  parabolic.f90
  periodic.f90
  solvebv.f90
  support.f90
  timeint.f90
  toolboxae.f90
  toolboxbv.f90
#]]

set (AUTO_FSRC_FILES
#  unix.f90
  nompi.f90
  auto_constants.f90
  f2003.f90
  lapack.f
  blas.f
  nompi.f90
  mesh.f90
  support.f90
  io.f90
  floquet.f90
  solvebv.f90
  interfaces.f90
  ae.f90
  toolboxae.f90
  bvp.f90
  equilibrium.f90
  timeint.f90
  toolboxbv.f90
  maps.f90
  periodic.f90
  homcont.f90
  optimization.f90
  parabolic.f90
)

#  mpi.f90

set (AUTO_CSRC_FILES
  user_c.f90
  ../include/auto_f2c.h
#  ../include/config.h
)

set (AUTO_HEADER_FILES
  ../include
#  ../include/auto.h
)


############################################################################
# add auto_f lib
# create the auto_f library so that user can link to it.
############################################################################
add_library(auto_f
   ${AUTO_FSRC_FILES}
)
add_library(auto::auto_f ALIAS auto_f)

# Make sure the compiler can find include files for our Hello library
# when other libraries or executables link to Hello
target_include_directories(auto_f
  PUBLIC
    ${AUTO_HEADER_FILES}
)

add_library(auto_f_main OBJECT main.f90)
add_dependencies(auto_f_main auto_f)
# main.f90 needs AUTOMPI.mod which is compiled in auto_f, cmake cannot
# automatically resolve this dependency, so need force it here.

add_library(auto::auto_f_main ALIAS auto_f_main)
add_library(auto::auto_main ALIAS auto_f_main)
target_include_directories(auto_f_main
  PRIVATE
    ${AUTO_HEADER_FILES}
)

############################################################################
# add auto_c lib
############################################################################
add_library(auto_c
   ${AUTO_CSRC_FILES}
)

add_library(auto::auto_c ALIAS auto_c)

# Make sure the compiler can find include files for our Hello library
# when other libraries or executables link to Hello
target_include_directories(auto_c
  PUBLIC
    ${AUTO_HEADER_FILES}
)

target_link_libraries(auto_c
  PUBLIC
    ${auto_f}
)
# install libauto_c into lib folder of the install directory.
# also include our public header file into the install step and tell cmake to put it into include.
install(TARGETS auto_c DESTINATION lib)
install(FILES  ../include/auto.h DESTINATION include)

#foreach (p ${NMPROGRAMS})
#  add_executable (${p} "${p}.f")
#endforeach (p)

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")

