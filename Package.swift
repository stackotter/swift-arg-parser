// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsyncTest",
    platforms: [.macOS(.v10_15)],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "AsyncTest",
            dependencies: []),
        .testTarget(
            name: "AsyncTestTests",
            dependencies: ["AsyncTest"]),
    ]
)
