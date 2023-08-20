add_library(StackOtterArgParserToolInfo STATIC
  ToolInfo.swift)

# NOTE: workaround for CMake not setting up include flags yet
set_target_properties(StackOtterArgParserToolInfo PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY})
target_compile_options(StackOtterArgParserToolInfo PRIVATE
  $<$<BOOL:${BUILD_TESTING}>:-enable-testing>)

set_property(GLOBAL APPEND PROPERTY StackOtterArgParser_EXPORTS StackOtterArgParserToolInfo)
