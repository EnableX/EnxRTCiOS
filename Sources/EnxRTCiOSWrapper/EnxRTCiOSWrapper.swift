// EnxRTCiOSWrapper.swift
// This file ensures EnablexWebRTC is automatically linked when EnxRTCiOS is imported

import Foundation

// Re-export EnablexWebRTC so users can access it automatically
@_exported import EnablexWebRTC

// Re-export EnxRTCiOS (your main binary framework)
@_exported import EnxRTCiOS

// Optional: Add any bridge functions or wrapper code here if needed
// For example, if you want to provide convenience methods that use both frameworks

/*
// Example bridge function (uncomment if needed):
public class EnxRTCManager {
    public static func initializeWithWebRTC() {
        // Your initialization code that uses both frameworks
    }
}
*/
