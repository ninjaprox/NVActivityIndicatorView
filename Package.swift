// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NVActivityIndicatorView",
    products: [
        .library(name: "NVActivityIndicatorView", targets: ["NVActivityIndicatorView"])
    ],
    dependencies: [],
    targets: [
        .target(name: "NVActivityIndicatorView", path: "Source/NVActivityIndicatorView")
    ]
)
