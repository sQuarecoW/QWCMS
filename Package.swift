// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QWCMS",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "QWCMS",
            targets: ["QWCMS"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0"),
        
        .package(url: "https://github.com/vapor/auth.git", from: "2.0.0"),
        
        // Redis
        .package(url: "https://github.com/vapor/redis.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "QWCMS",
            dependencies: ["Vapor", "Leaf", "FluentPostgreSQL", "Authentication", "Redis"]),
        .testTarget(
            name: "QWCMSTests",
            dependencies: ["QWCMS"]),
    ]
)
