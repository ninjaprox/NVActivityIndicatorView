SCLAlertView
===========

Animated Alert View. Written in Swift

![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png)_
![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/errorScreenshot.png) 



###Easy to use
```swift
// Get started
let alertview : SCLAlertViewResponder = SCLAlertView().showSuccess(self, title: "Hello World", subTitle: "This is a more descriptive text.")

// Upon displaying, change/close view
alertview.setTitle("New Title") // Rename title
alertview.setSubTitle("New description") // Rename subtitle
alertview.Close() // Close view

// Alternative alert types
SCLAlertView().showError(self, title: "Hello World", subTitle: "This is a more descriptive text.") // Error
SCLAlertView().showNotice(self, title: "Hello World", subTitle: "This is a more descriptive text.") // Notice
SCLAlertView().showWarning(self, title: "Hello World", subTitle: "This is a more descriptive text.") // Warning
SCLAlertView().showInfo(self, title: "Hello World", subTitle: "This is a more descriptive text.") // Info

// Advanced
SCLAlertView().showTitle(
    view: self, // Parent view controller
    title: String, // Title of view
    subTitle: String, // String of view
    duration: kDefaultAnimationDuration, // Duration to show before closing automatically, default: 2.0
    completeText: String?, // Optional button value, default: ""
    style: SCLAlertViewStyle.Success // Styles - see below.
)
```

####Alert View Styles
```swift
enum SCLAlertViewStyle: Int {
    case Success
    case Error
    case Notice
    case Warning
    case Info
}
```

### Installation

SCLAlertView is available through [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'SCLAlertView'

###Incoming improvements
- More animations
- Blocks
- Performance tests

Has been developed initially for the [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

- Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max
- Development [@hackua](https://twitter.com/hackua) Viktor Radchenko
- Improvements by [@bih](http://github.com/bih) Bilawal Hameed
