// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Trophy",
    platforms: [
        .iOS(.v14) // You can specify the iOS version you're targeting
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Trophy",
            targets: ["Trophy"]),
    ],
    dependencies: [
        // Add dotenv-swift as a dependency
        .package(url: "https://github.com/swift-aws/aws-sdk-swift.git", from: "3.0.0"),
        .package(url: "https://github.com/SwiftOnTheServer/dotenv-swift.git", from: "5.0.0")
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Trophy",
            dependencies: [
                .product(name: "Dotenv", package: "dotenv-swift") // Link Dotenv to your target
            ]),
        .testTarget(
            name: "TrophyTests",
            dependencies: ["Trophy"]),
    ]
)

