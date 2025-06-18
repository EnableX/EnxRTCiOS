// swift-tools-version:5.7
import PackageDescription
let package = Package(
    name: "EnxRTCiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "EnxRTCiOS", targets: ["EnxRTCiOSWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/EnableX/EnablexWebRTC.git", from: "2.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "EnxRTCiOS",
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.0.21/EnxRTCiOS.xcframework_3.0.21.zip",
            checksum: "7f15a87a4492a130d234733b7eb37a1cbae99ba54d04e928880e0e6e756d1d7d"
        ),
        .target(
            name: "EnxRTCiOSWrapper",
            dependencies: [
                "EnxRTCiOS",
                .product(name: "EnablexWebRTC", package: "EnablexWebRTC")
            ],
            path: "Sources/EnxRTCiOSWrapper"
        )
    ]
)
