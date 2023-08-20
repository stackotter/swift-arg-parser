// swift-tools-version:5.5
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
    ],
    dependencies: [],
    targets: [
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
            dependencies: [],
            path: "Sources/ArgumentParserToolInfo",
            exclude: ["CMakeLists.txt"]),

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

        .testTarget(
            name: "StackOtterArgParserEndToEndTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserEndToEndTests",
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "StackOtterArgParserUnitTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserUnitTests",
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "StackOtterArgParserPackageManagerTests",
            dependencies: ["StackOtterArgParser", "StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserPackageManagerTests",
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "StackOtterArgParserExampleTests",
            dependencies: ["StackOtterArgParserTestHelpers"],
            path: "Tests/ArgumentParserExampleTests",
            resources: [.copy("CountLinesTest.txt")]),
    ]
)

#if swift(>=5.6) && os(macOS)
package.targets.append(contentsOf: [
    .executableTarget(
        name: "count-lines",
        dependencies: ["StackOtterArgParser"],
        path: "Examples/count-lines"),
    .executableTarget(
        name: "changelog-authors",
        dependencies: ["StackOtterArgParser"],
        path: "Tools/changelog-authors"),
    ])
#endif
