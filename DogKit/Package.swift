// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DogKit",
    defaultLocalization: "en",
    products: [
        .library(
            name: "DogKit",
            targets: ["DogKit"]
        )
    ],
    dependencies: [
       .package(url: "https://github.com/liamnichols/xcstrings-tool-plugin", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "DogKit",
            dependencies: [
                .product(name: "XCStringsToolPlugin", package: "xcstrings-tool-plugin")
            ],
            path: "Sources"
        )
    ]
)
