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
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.1.4/EnxRTCiOS.xcframework_3.1.4.zip",
            checksum: "09c827c1bf30210552f63ec16c4c205e874fd405baf53ac8bebf27dfa7ad37b7"
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
