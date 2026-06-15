// EnablexWebRTC.swift
//
// This wrapper target exists to force Xcode to embed EnablexWebRTC.xcframework
// into the host app when EnxRTCiOS is installed via SPM.
//
// Background: EnxRTCiOS.xcframework is a prebuilt binary with a dynamic link to
// EnablexWebRTC.framework (@rpath/EnablexWebRTC.framework/EnablexWebRTC).
// SPM binary targets (xcframeworks) that are only transitive dependencies of
// another binary target are not reliably embedded by Xcode. This source target
// — which directly imports EnablexWebRTC — acts as an explicit linker anchor that
// forces Xcode to process and embed EnablexWebRTC.xcframework into the app bundle.

import Foundation
@_exported import EnablexWebRTC

// Public anchor symbol — prevents the linker from dead-stripping this module,
// which would remove the EnablexWebRTC embed requirement.
public enum _EnablexWebRTCEmbedAnchor {}
