// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "ChitChat",
    platforms: [
        .iOS(.v26),
        .visionOS(.v26),
        .macOS(.v26)
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
