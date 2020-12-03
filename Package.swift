// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InflectorKit",
    products: [
        .library(
          name: "InflectorKit",
          targets: ["InflectorKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "InflectorKit",
            dependencies: [],
            path: "InflectorKit"
        )
    ]
)
