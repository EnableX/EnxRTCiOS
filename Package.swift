
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
            url: "https://www.enablex.io/downloads/EnxRTCiOS.xcframework.zip",
            checksum: "cbc9ef5eb8ebd26de8e95fb36125a703fde4786146ae189c0d4dbd0a934278f1"
        ),
        .binaryTarget(
            name: "EnablexWebRTC",
            url: "https://www.enablex.io/downloads/EnablexWebRTC.xcframework_1.0.4.zip",
            checksum: "6ef4e8c6f78eddbc9d4f478ea14fb111cf58199a976b15aff37779ae0fe04b6c"
        )
    ]
)
