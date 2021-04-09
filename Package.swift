// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AboutView",
        platforms: [
           .iOS(.v14),
           .macOS(.v11),
           .tvOS(.v14),
           .watchOS(.v7)
       ],
        products: [
            .library(
                name: "AboutView",
                targets: ["AboutView"])
        ],
        dependencies: [
            .package(name: "HttpRequestHook", url: "https://github.com/pontusntengnas/swift-http-hook", from: "1.0.0")
        ],
    targets: [
        .target(
            name: "AboutView",
            dependencies: ["HttpRequestHook"])
    ]
)
