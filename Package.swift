// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SUIWebView",
    products: [
        .library(
            name: "SUIWebView",
            targets: ["SUIWebView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "SUIWebView"),
        .testTarget(
            name: "SUIWebViewTests",
            dependencies: ["SUIWebView"]),
    ]
)
