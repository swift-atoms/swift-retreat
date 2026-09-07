// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-retreat",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Retreat", targets: ["Retreat"]),

        .library(name: "Retreat Foundation Integration", targets: ["Retreat Foundation Integration"]),
        .library(name: "Retreat Test Support", targets: ["Retreat Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-subtraction.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Retreat",
            dependencies: [
                .product(name: "Subtraction", package: "swift-subtraction"),
            ],
            path: "Sources/Retreat"
        ),
        
        .target(
            name: "Retreat Foundation Integration",
            dependencies: [
                .target(name: "Retreat"),
            ],
            path: "Sources/Retreat Foundation Integration"
        ),
        .target(
            name: "Retreat Test Support",
            dependencies: [
                .target(name: "Retreat"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Retreat Tests",
            dependencies: [
                .target(name: "Retreat"),
                .product(name: "Subtraction", package: "swift-subtraction"),
                .target(name: "Retreat Test Support"),
                .target(name: "Retreat Foundation Integration"),
            ],
            path: "Tests/Retreat Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
