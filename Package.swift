// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "ChitChat",
    products: [
        .library(name: "ChitChat", targets: ["ChitChat"])
    ],
    targets: [
        .target(name: "ChitChat")
    ],
    swiftLanguageModes: [.v6]
)
