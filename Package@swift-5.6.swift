// swift-tools-version:5.6
//===----------------------------------------------------------*- swift -*-===//
//
// This source file is part of the Swift Argument Parser open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import PackageDescription

var package = Package(
    name: "swift-argument-parser",
    products: [
        .library(
            name: "StackOtterArgParser",
            targets: ["StackOtterArgParser"]),
        .plugin(
            name: "GenerateManual",
            targets: ["GenerateManual"]),
    ],
    dependencies: [],
    targets: [
        // Core Library
        .target(
            name: "StackOtterArgParser",
            dependencies: ["StackOtterArgParserToolInfo"],
            path: "Sources/ArgumentParser",
            exclude: ["CMakeLists.txt"]),
        .target(
            name: "StackOtterArgParserTestHelpers",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserToolInfo"],
            path: "Sources/ArgumentParserTestHelpers",
            exclude: ["CMakeLists.txt"]),
        .target(
            name: "StackOtterArgParserToolInfo",
            dependencies: [ ],
            path: "Sources/ArgumentParserToolInfo",
            exclude: ["CMakeLists.txt"]),

        // Plugins
        .plugin(
            name: "GenerateManual",
            capability: .command(
                intent: .custom(
                    verb: "gen-manual",
                    description: "Generate a manual entry for a specified target.")),
            dependencies: ["gen-manual"]),

        // Examples
        .executableTarget(
            name: "roll",
            dependencies: ["StackOtterArgParser"],
            path: "Examples/roll"),
        .executableTarget(
            name: "math",
            dependencies: ["StackOtterArgParser"],
            path: "Examples/math"),
        .executableTarget(
            name: "repeat",
            dependencies: ["StackOtterArgParser"],
            path: "Examples/repeat"),

        // Tools
        .executableTarget(
            name: "gen-manual",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserToolInfo"],
            path: "Tools/generate-manual"),
    
        // Tests
        .testTarget(
            name: "StackOtterArgParserEndToEndTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserEndToEndTests",
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "StackOtterArgParserExampleTests",
            dependencies: ["StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserExampleTests",
            resources: [.copy("CountLinesTest.txt")]),
        .testTarget(
            name: "StackOtterArgParserGenerateManualTests",
            dependencies: ["StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserGenerateManualTests"),
        .testTarget(
            name: "StackOtterArgParserPackageManagerTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserPackageManagerTests",
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "StackOtterArgParserUnitTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserUnitTests",
            exclude: ["CMakeLists.txt"]),
    ]
)

#if os(macOS)
package.targets.append(contentsOf: [
    // Examples
    .executableTarget(
        name: "count-lines",
        dependencies: ["StackOtterArgParser"],
        path: "Examples/count-lines"),

    // Tools
    .executableTarget(
        name: "changelog-authors",
        dependencies: ["StackOtterArgParser"],
        path: "Tools/changelog-authors"),
    ])
#endif
