// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Ravij4057CapacitorShake",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Ravij4057CapacitorShake",
            targets: ["MyShakePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "MyShakePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/MyShakePlugin"),
        .testTarget(
            name: "MyShakePluginTests",
            dependencies: ["MyShakePlugin"],
            path: "ios/Tests/MyShakePluginTests")
    ]
)