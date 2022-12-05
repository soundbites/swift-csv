// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCSV",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "SwiftCSV",
            targets: ["SwiftCSV"]),
    ],
    targets: [
        .target(name: "SwiftCSV"),
        .executableTarget(name: "SwiftCSVCommandLine", dependencies: ["SwiftCSV"]),
        .testTarget(
            name: "SwiftCSVTests",
            dependencies: ["SwiftCSV"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
