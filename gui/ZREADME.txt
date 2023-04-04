##
## THIS DOES NOT BUILD ANYMORE
## auto97 gui requires Motif/X11 SDK.
##

enable_language(C)
add_executable (auto97 auto97.c)
target_link_libraries(auto97
  PRIVATE
  auto::auto_c
)

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#         RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#         DESTINATION "bin")
