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
alertview.close() // Close view

// Alternative alert types
SCLAlertView().showError(self, title: "Hello Error", subTitle: "This is a more descriptive error text.") // Error
SCLAlertView().showNotice(self, title: "Hello Notice", subTitle: "This is a more descriptive notice text.") // Notice
SCLAlertView().showWarning(self, title: "Hello Warning", subTitle: "This is a more descriptive warning text.") // Warning
SCLAlertView().showInfo(self, title: "Hello Info", subTitle: "This is a more descriptive info text.") // Info

// Advanced
SCLAlertView().showTitle(
    view: self, // Parent view controller
    title: "Congratulations", // Title of view
    subTitle: "Operation successfully completed.", // String of view
    duration: kDefaultAnimationDuration, // Duration to show before closing automatically, default: 2.0
    completeText: "Done", // Optional button value, default: ""
    style: .Success // Styles - see below.
)
```

####Alert View Styles
```swift
enum SCLAlertViewStyle: Int {
    case Success, Error, Notice, Warning, Info
}
```

### Installation

SCLAlertView is available through [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'SCLAlertView'

### Collaboration
I tried to build an easy to use API, while beeing flexible enough for multiple variations, but I'm sure there are ways of improving and adding more features, so feel free to collaborate with ideas, issues and/or pull requests.

###Incoming improvements
- More animations
- Blocks
- Performance tests

Has been developed initially for the [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

- Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max
- Development [@hackua](https://twitter.com/hackua) Viktor Radchenko
- Improvements by [@bih](http://github.com/bih) Bilawal Hameed, [@rizjoj](http://github.com/rizjoj) Riz Joj 
