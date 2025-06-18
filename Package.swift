
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "EnxRTCiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "EnxRTCiOS", targets: ["EnxRTCiOS"]),
        .library(name: "EnablexWebRTC", targets: ["EnablexWebRTC"])
    ],
    targets: [
        .binaryTarget(
            name: "EnxRTCiOS",
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.0.21/EnxRTCiOS.xcframework_3.0.21.zip",
            checksum: "7f15a87a4492a130d234733b7eb37a1cbae99ba54d04e928880e0e6e756d1d7d"
        ),
        .binaryTarget(
            name: "EnablexWebRTC",
            url: "https://developer.enablex.io/downloads/EnablexWebRTC.xcframework_2.0.0.zip",
            checksum: "60fdf989c1fcf249a9f146cfa70654fef1b569319c5c6bd9d6d94e4edbf192a7"
        )
    ]
)
