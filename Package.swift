// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swiftui-variadic-views",
    products: [
        .library(
            name: "VariadicViews",
            targets: ["VariadicViews"]
        ),
    ],
    targets: [
        .target(
            name: "VariadicViews"
        ),
    ]
)
