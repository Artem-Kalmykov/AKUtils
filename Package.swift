// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "AKUtils",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "AKUtils",
            targets: ["AKUtils"]
        ),
    ],
    targets: [
        .target(
            name: "AKUtils",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
