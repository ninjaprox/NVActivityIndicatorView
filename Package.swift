// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "NVActivityIndicatorView",
    // platforms: [.iOS("8.0"), .tvOS("9.0")],
    products: [
        .library(name: "NVActivityIndicatorView", targets: ["NVActivityIndicatorView"])
    ],
    targets: [
        .target(
            name: "NVActivityIndicatorView",
            path: "Source/NVActivityIndicatorView"
        )
    ]
)
