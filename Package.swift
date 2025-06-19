
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
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.1.0/EnxRTCiOS.xcframework_3.1.0.zip",
            checksum: "9d40b991426f7010944eb2ce601573d4c3645e3cf52bbf80bb13510675afd703"
        ),
        .binaryTarget(
            name: "EnablexWebRTC",
            url: "https://developer.enablex.io/downloads/EnablexWebRTC.xcframework_2.0.0.zip",
            checksum: "60fdf989c1fcf249a9f146cfa70654fef1b569319c5c6bd9d6d94e4edbf192a7"
        )
    ]
)
