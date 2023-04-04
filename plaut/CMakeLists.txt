
add_executable (plautmain plautdev.f plautint.f plautlib.f plautmain.f)
target_link_libraries(plautmain
  PRIVATE
  auto::auto_f
)

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")
