// swift-tools-version: 6.3

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
        .package(url: "https://github.com/TopScrech/ScrechKit", branch: "main")
    ],
    targets: [
        .target(
            name: "ChitChat",
            dependencies: ["ScrechKit"]
        )
    ],
    swiftLanguageModes: [.v6]
)
