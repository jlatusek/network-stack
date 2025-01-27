install(
    TARGETS network-stack_exe
    RUNTIME COMPONENT network-stack_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
