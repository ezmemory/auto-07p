
add_library(utility_obj OBJECT utility.f90)

macro(add_utility_app app_name src_file)
  add_executable (${app_name} ${src_file})
  target_link_libraries(${app_name}
    PRIVATE
      utility_obj
  )

  message(" === ${src_file} is added to build ==")
endmacro()


add_utility_app(autlab autlab.f90)
add_utility_app(double double.f90)
add_utility_app(keepbp keepbp.f90)
add_utility_app(keeplp keeplp.f90)
add_utility_app(keepuz keepuz.f90)
add_utility_app(keepsp keepsp.f90)
add_utility_app(deletelp deletelp.f90)
add_utility_app(listlabels listlabels.f90)
add_utility_app(zero zero.f90)
add_utility_app(reduce reduce.f90)

add_executable (relabel relabel.f90)
target_link_libraries(relabel
  PRIVATE
  auto::auto_f
)

add_executable (zero.exe zero.f90)


# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")
