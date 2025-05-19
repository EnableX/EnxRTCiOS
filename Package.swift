
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
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.0.20/EnxRTCiOS.xcframework_3.0.20.zip",
            checksum: "e246b8f951cf222829d1b5ef7c615d4a2e37844983d5f1c06533a8219252e1e6"
        ),
        .binaryTarget(
            name: "EnablexWebRTC",
            url: "https://developer.enablex.io/downloads/EnablexWebRTC.xcframework_1.0.4.zip",
            checksum: "6ef4e8c6f78eddbc9d4f478ea14fb111cf58199a976b15aff37779ae0fe04b6c"
        )
    ]
)
