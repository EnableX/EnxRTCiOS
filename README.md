# EnxRTCiOS

A Swift Package Manager distribution for EnxRTCiOS framework that automatically includes EnablexWebRTC for iOS video calling and real-time communication.

## 📋 Requirements

- iOS 13.0+
- Xcode 12.0+
- Device-only builds (no simulator support)

## 📦 What's Included

When you add this package, you automatically get:
- ✅ **EnxRTCiOS** - Main iOS SDK framework
- ✅ **EnablexWebRTC** - WebRTC framework (auto-included)

## 🚀 Installation

### Swift Package Manager

Add this package to your iOS project:

```swift
dependencies: [
    .package(url: "https://github.com/EnableX/EnxRTCiOS.git", from: "3.1.3")
]
```

Or in Xcode:
1. Go to **File → Add Package Dependencies...**
2. Enter the repository URL: `https://your-repo-url.git`
3. Select the version and add to your target

## 💡 Usage

### Import the Framework

```swift
import EnxRTCiOS
// EnablexWebRTC is automatically available through EnxRTCiOS
```

### Basic Usage

```swift
// Initialize your video calling functionality
// (Add your specific usage examples here)
```

## 🔧 Technical Details

### Package Structure
- **Package Name**: `EnxRTCiOS` (appears as dependency name)
- **Product**: `EnxRTCiOS` (single library containing both frameworks)
- **Auto-Dependencies**: `EnablexWebRTC` is automatically fetched from https://github.com/EnableX/EnablexWebRTC.git

### Build Configuration
- **Platforms**: iOS 13.0+
- **Architectures**: arm64 (device-only)
- **No Simulator Support**: Both frameworks are optimized for device builds only

## 🛠 Development Notes

- This package automatically resolves and includes EnablexWebRTC when added to projects
- Users only need to add the EnxRTCiOS package - EnablexWebRTC is included automatically
- Both frameworks are pre-compiled XCFrameworks for optimal performance

## How to use

Go to your class, where you wanted to implement the Video/Audio/Chat feature, import the libraray
```swift
    import EnxRTCiOS
```
Create the objects for required SDK classes

```swift
    var enxRoom : EnxRoom!
```
This is the object of EnxRoom class, all room based functions/mothods need to call through this object. Once you are connected to the room , you will receive **didConnect** callBack with the reference of EnxRoom to be assign to the **enxRoom** object.
```swift
    var enxRTC : EnxRtc!
```
This is the object of EnxRTC class. EnxRTC will give you single method to connect with room. It will also do all internal formalities required for connection like creating EnxRoom, EnxStream etc.

```swift
    var enxStream : EnxStream!
```
This is the object of EnxStream class, all stream based functions/methods must be called through this object.

```swift
    var enxPlayerView : EnxPlayerView!
```
This is the object of EnxPlayerView class. This is used to play local or remote video streaming.

**How to join the EnableX Room?**   
You need to call join method as code given below - 

```swift
    enxRTC = EnxRtc()
    guard let steam = enxRTC.joinRoom(token, delegate: self, publishStreamInfo: localStreamInfo, roomInfo: roomInfo , advanceOptions: nil) else{return}
                self.localStream = steam
                self.localStream.delegate = self as EnxStreamDelegate
```
*Function Parameters*

- `token` is must be a valid EnableX session token as string.
- `delegate` is instance of class where you receive events notifications.
- `publishStreamInfo` contrains Local EnxStream information as [[String : Any]](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/stream-configuration/content/local-stream/).
- `roomInfo` contains EnxRoom Basice information as [[String : Any]](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/room-connection/index/).
- `advanceOptions` this is an optional parameter, provide as [[Any]](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/room-connection/index/).

*Callbacks* 

- On getting connected with EnableX Room, following callbacks are received:

        func room(_ room: EnxRoom?, didConnect roomMetadata: [String : Any]?)
        func room(_ room: EnxRoom?, didAddedStream stream: EnxStream?)
        func room(_ room: EnxRoom?, didActiveTalkerList Data: [EnxStream]?) or func room(_ room: EnxRoom?, didActiveTalkerView view: UIView?)

- On failing to connect with Enablex Room, following callback are received:

        func room(_ room: EnxRoom?, didError reason: [Any]?)

- On being disconnected from EnableX Room, following callbacks are received:

        func didRoomDisconnect(_ response: [Any]?)

- On joining or exiting EnabeX Room by others users, following callbacks are received:

        func room(_ room: EnxRoom?, userDidJoined Data: [Any]?)
    
**Note:** Developers must implement the above mentioned Callbacks as they are mandatory to handle. All other Callbacks, given in Developer Documentation; are optional and may be implemented if needed.


## 🔗 Related Links

- [EnablexWebRTC Repository](https://github.com/EnableX/EnablexWebRTC.git)
- [EnableX Platform Documentation](https://developer.enablex.io/docs/references/sdks/video-sdk/ios-sdk/index/)

## 🆘 Support

For issues or questions:
1. Check the documentation
2. Contact support team
