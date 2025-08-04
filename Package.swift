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
            url: "https://developer.enablex.io/downloads/iOS_SDK_3.1.3/EnxRTCiOS.xcframework_3.1.3.zip",
            checksum: "3eb8da549ec613ae8d7eecd3ffd56e792542ae0519ede755cd188d55799addd1"
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
