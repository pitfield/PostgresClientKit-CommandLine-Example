// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PostgresClientKit-CommandLine-Example",
    dependencies: [
        .package(url: "https://github.com/codewinsdotcom/PostgresClientKit", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "PostgresClientKit-CommandLine-Example",
            dependencies: [ "PostgresClientKit" ]),
    ]
)
