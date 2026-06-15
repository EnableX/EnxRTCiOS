// swift-tools-version:5.7
import PackageDescription

// ── How dependencies are delivered ───────────────────────────────────────────
//
//  EnxRTCiOS.xcframework  — prebuilt, dynamic
//    ├── EnablexWebRTC.framework  — prebuilt, dynamic  (declared below, auto-embedded)
//    └── SocketIO                 — statically linked into EnxRTCiOS binary (no separate install)
//
// EnablexWebRTC is declared as a binaryTarget in THIS package (not as an
// external package dependency). Including it directly in the product's targets
// list is the only reliable way for Xcode to:
//   1. Download the xcframework
//   2. Stage it in PackageFrameworks/
//   3. Embed & sign it into App.app/Frameworks/
//
// When the user adds the "EnxRTCiOS" library product to their app target,
// Xcode processes both binary targets — EnxRTCiOS AND EnablexWebRTC — and
// embeds them automatically. No manual steps required.
//
// EnablexWebRTC is also available as its own standalone package at:
//   https://github.com/EnableX/EnablexWebRTC
// Users who install EnxRTCiOS via this package do NOT need to add
// EnablexWebRTC separately — it is already pulled in here.
// ─────────────────────────────────────────────────────────────────────────────

let package = Package(
    name: "EnxRTCiOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // One product, two binary targets.
        // Xcode will link AND embed both xcframeworks when this product
        // is added to an app target.
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
