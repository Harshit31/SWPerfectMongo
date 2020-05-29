// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectMongoDB",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PerfectMongoDB",
            targets: ["PerfectMongoDB"]),
    ],
    dependencies: [
         // Dependencies declare other packages that this package depends on.
         // .package(url: /* package url */, from: "1.0.0"),
         .package(url: "https://github.com/PerfectlySoft/PerfectLib.git", from: "3.0.0")
     ],
     targets: [
         // Targets are the basic building blocks of a package. A target can define a module or a test suite.
         // Targets can depend on other targets in this package, and on products in packages which this package depends on.
         .target(
             name: "PerfectMongoDB",
             dependencies: ["PerfectLib", "CLibMongoC"]),
         .target(
             name: "CLibMongoC",
             dependencies: [],
             cSettings: [
                 .define("MONGO_SWIFT_OS_LINUX", .when(platforms: [.linux])),
                 .define("MONGO_SWIFT_OS_DARWIN", .when(platforms: [.macOS])),
                 .define("BSON_COMPILATION"),
                 .define("MONGOC_COMPILATION")
             ],
             linkerSettings: [
                 .linkedLibrary("resolv"),
                 .linkedLibrary("ssl", .when(platforms: [.linux])),
                 .linkedLibrary("crypto", .when(platforms: [.linux])),
                 .linkedLibrary("z", .when(platforms: [.linux]))
             ]
         ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .testTarget(
            name: "PerfectMongoDBTests",
            dependencies: ["PerfectMongoDB"]),
    ]
)
