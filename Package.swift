// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "EnxRTCiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "EnxRTCiOS", targets: ["EnxRTCiOS", "EnablexWebRTCWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/EnableX/EnablexWebRTC.git", from: "2.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "EnxRTCiOS",
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.1.1/EnxRTCiOS.xcframework_3.1.1.zip",
            checksum: "d75a02c31b7d2b3df85650b34e473d5e99ed059e13b7c09162e0ebefd28ffab6"
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
