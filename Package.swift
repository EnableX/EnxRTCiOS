
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
            url: "https://developer.enablex.io/downloads/EnablexWebRTC.xcframework_1.0.5.zip",
            checksum: "b83804784da20b95d8eec0d48614f9071cdacfe2e7cda229a236890bc8dbfac8"
        )
    ]
)
