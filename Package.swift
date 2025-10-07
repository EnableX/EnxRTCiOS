// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "EnxRTCiOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "EnxRTCiOS", targets: ["EnxRTCiOS", "EnablexWebRTCWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/EnableX/EnablexWebRTC.git", from: "2.0.2")
    ],
    targets: [
        .binaryTarget(
            name: "EnxRTCiOS",
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.1.5/EnxRTCiOS.xcframework_3.1.5.zip",
            checksum: "5dc5bf8fae68919a47e92930bccd99ca548f085badac7dcecd9e0a60dc627252"
        ),
        .target(
            name: "EnablexWebRTCWrapper",
            dependencies: [
                .product(name: "EnablexWebRTC", package: "EnablexWebRTC")
            ],
            path: "Sources/EnablexWebRTC"
        )
    ]
)
