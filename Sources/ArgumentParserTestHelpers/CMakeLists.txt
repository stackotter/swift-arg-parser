add_library(StackOtterArgParserTestHelpers
  StringHelpers.swift
  TestHelpers.swift)
set_target_properties(StackOtterArgParserTestHelpers PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY})
target_link_libraries(StackOtterArgParserTestHelpers PUBLIC
  StackOtterArgParser
  XCTest
  Foundation)
