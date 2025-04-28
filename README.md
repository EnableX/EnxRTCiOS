# EnxRTCiOS

**EnxRTCiOS** is an iOS toolkit used for building native iOS applications to integrate real-time communication using the EnableX Platform. This toolkit exposes functions, methods, and notifications required to communicate with EnableX signaling and media servers using a valid token to carry out an RTC session.

## Documentation

For API documentation, see the library's official documentation in Xcode or on the Web.

[APIs Documentation](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/index/)

## Adding EnxRTCiOS as a Dependency

To use the `EnxRTCiOS` library in a SwiftPM project, 
add the following line to the dependencies in your `Package.swift` file:

```swift
.package(url: "https://github.com/EnableX/EnxRTCiOS.git", from: "1.0.0"),
```

## How to use

Go to your class, where you wanted to implement the Video/Audio/Chat feature, import the libraray
```swift
import EnxRTCiOS
```
Create the object of sdk classes

```swift
### Properties
    var enxRoom : EnxRoom! `This is for room class, all room based Apis need to call through this object, once you are connected with room , you will receive **didConnect** call back with the refrence of EnxRoom, just assign it will enxRoom object.`
    var objectJoin : EnxRtc! 
    var localStream : EnxStream!
```
