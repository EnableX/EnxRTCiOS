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
Create the objects for required sdk classes

```swift
    var enxRoom : EnxRoom!
```
This is the object of Enxroom class, all room based Apis need to call through this object, once you are connected to the room , you will receive **didConnect** call back with the reference of EnxRoom, assign it to the **enxRoom** object.
```swift
    var enxRTC : EnxRtc!
```
This is the object of EnxRTC class, EnxRTC will give you are single Apis to connect with room. Its will also do all internal formalities required for connection , like creating EnxRoom,EnxStream etc..

```swift
    var enxStream : EnxStream!
```
This is the object of EnxStream class, all stream based Apis must be called through this object.

```swift
    var enxPlayerView : EnxPlayerView!
```
This is the object of EnxPlayerView class, this will used to local or remote video streaming.

**How to join the EnableX Room**   you need to call join Aps as below code

```swift
        enxRTC = EnxRtc()
        guard let steam = enxRTC.joinRoom(token, delegate: self, publishStreamInfo: localStreamInfo, roomInfo: roomInfo , advanceOptions: nil) else{return}
                self.localStream = steam
                self.localStream.delegate = self as EnxStreamDelegate
```
Here 
    **token** is must va valid EnxbaleS session token as string
    **delegate** instance of class where you receive the events notifications
    **publishStreamInfo** Local EnxStream details as [String : Any](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/stream-configuration/content/local-stream/)
    **roomInfo** EnxRoom Basice information as [String : Any](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/room-connection/index/)
    **advanceOptions** this is an optional as [Any](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/room-connection/index/)

**Once connected with EnableX Room** developer will receive callbacks as

```swift
        func room(_ room: EnxRoom?, didConnect roomMetadata: [String : Any]?)
        func room(_ room: EnxRoom?, didAddedStream stream: EnxStream?)
        func room(_ room: EnxRoom?, didActiveTalkerList Data: [EnxStream]?) or func room(_ room: EnxRoom?, didActiveTalkerView view: UIView?) Based on request during connect
```

** Once failed to connect with Enablex Room** developer will receive callback as

```swift
    func room(_ room: EnxRoom?, didError reason: [Any]?)
```
**Once disconnect with EnableX Room** developer will receive callbacks as
```swift
        func didRoomDisconnect(_ response: [Any]?)
```
**Once any other user conenct and disconnect** with same Enablex room, developer will receive as notification as 

```swift
    func room(_ room: EnxRoom?, userDidJoined Data: [Any]?)
    func room(_ room: EnxRoom?, userDidDisconnected Data: [Any]?)
```
**Note**:- These are the required callback developer must need to implement, other callback are option based on service needs, Developer need to implement.
