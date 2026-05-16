// swift-tools-version: 6.3.2

import PackageDescription

let package = Package(
    name: "ChitChat",
    platforms: [
        .iOS(.v17),
        .visionOS(.v1),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ChitChat", targets: ["ChitChat"])
    ],
    dependencies: [
        .package(url: "https://github.com/TopScrech/ScrechKit", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ChitChat",
            dependencies: ["ScrechKit"]
        )
    ],
    swiftLanguageModes: [.v6]
)
