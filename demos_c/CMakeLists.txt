macro(SUBDIRLIST result curdir)

  # message ( " => ${curdir}")

  # The RELATIVE command is broken:
  # file(GLOB sub_dir LIST_DIRECTORIES true RELATIVE $curdir $curdir/*)
  # so have to use the following work around. First get full path,
  # then use file(RELATIVE path) to get the relative path.

  file(GLOB sub_dir LIST_DIRECTORIES true *) #here cannot use ${curdir}/* either!!
  # message ( " => ${sub_dir}")

  set(dirlist "")
  foreach(dir ${sub_dir})
    file(RELATIVE_PATH rdir ${curdir} ${dir})
    if(IS_DIRECTORY ${curdir}/${rdir})
      list(APPEND dirlist ${rdir})
    endif()
  endforeach()
  set(${result} ${dirlist})
endmacro()

SUBDIRLIST(sub_directories ${CMAKE_CURRENT_SOURCE_DIR})
message("${sub_directories}")

# loop through all folders and add the demo
foreach (p ${sub_directories})
  set(APP_EXE ${p}.exe)
  # message(" == add $APP_EXE")
  #add_library(${APP_EXE}.obj OBJECT "${p}/${p}.c")
  add_executable (${APP_EXE} "${p}/${p}.c")
  target_link_libraries(${APP_EXE}
    PRIVATE
      auto::auto_main
      auto::auto_c
      auto::auto_f
  )
  message(" === ${p} is added to build ==")
endforeach ()

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")
