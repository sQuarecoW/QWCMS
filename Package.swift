// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QWCMS",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "QWCMS",
            targets: ["QWCMS"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
        
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0-rc"),
        
        // Fluent
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-rc"),
        // Postgresql
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0-rc"),
        
        // Redis
        .package(url: "https://github.com/vapor/redis.git", from: "4.0.0-beta.5"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "QWCMS",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Redis", package: "redis")
        ]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
        ])
    ]
)
