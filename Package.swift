// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PostgresClientKit-CommandLineExample",
    dependencies: [
        .package(url: "https://github.com/pitfield/PostgresClientKit", .branch("develop")), // TODO: update URL and version number
    ],
    targets: [
        .target(
            name: "PostgresClientKit-CommandLineExample",
            dependencies: [ "PostgresClientKit" ]),
    ]
)
