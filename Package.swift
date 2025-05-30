// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
// @version 1.0.0 

import PackageDescription

let package = Package(
    name: "CheckUpdate",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CheckUpdate",
            targets: ["CheckUpdate"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CheckUpdate"),
        .testTarget(
            name: "CheckUpdateTests",
            dependencies: ["CheckUpdate"]
        ),
    ]
)
