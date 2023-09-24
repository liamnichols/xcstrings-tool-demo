// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DogKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DogKit",
            targets: ["DogKit"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DogKit",
            path: "Sources"
        )
    ]
)
