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
        .library(name: "EnxRTCiOS", targets: ["EnxRTCiOS", "EnablexWebRTC"])
    ],
    targets: [
        .binaryTarget(
            name: "EnxRTCiOS",
            url: "https://developer.enablex.io/downloads/video/ios/v3.1.6/EnxRTCiOS.xcframework_3.1.6.zip",
            checksum: "a2bb5d47b680b8079852e44dfd33b28b7b9ec19cff8ed302d26a14718c357f66"
        ),
        // EnablexWebRTC — declared inline so Xcode reliably embeds it.
        // Update url + checksum here whenever EnablexWebRTC releases a new version.
        .binaryTarget(
            name: "EnablexWebRTC",
            url: "https://developer.enablex.io/downloads/webrtc/ios/EnablexWebRTC.xcframework_2.0.2.zip",
            checksum: "adac7629eeb8d2a2776faf24e7d4195a0d9867a7ba29740c32462c656eef7c7c"
        )
    ]
)
