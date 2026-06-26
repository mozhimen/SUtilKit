// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SUtilKit.ObjectiveC",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SUtilKit.ObjectiveC",
            targets: ["SUtilKit.ObjectiveC"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SUtilKit.ObjectiveC",
            publicHeadersPath: "."
        )
    ]
)
