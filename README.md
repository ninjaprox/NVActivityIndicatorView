SCLAlertView
===========

Animated Alert View written in Swift, which can be used as a `UIAlertView` or `UIAlertController` replacement. Since `UIAlertView` is deprecated and `UIAlertController` only works on iOS 8.x or above, if you have a Swift project where you want to support iOS 7.x too, SCLAlertView is an ideal substitution.

![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png)_
![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/editScreenshot.png) 

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
SCLAlertView().showEdit(self, title: "Hello Edit", subTitle: "This is a more descriptive info text.") // Edit

// Advanced
SCLAlertView().showTitle(
    view: self, // Parent view controller
    title: "Congratulations", // Title of view
    subTitle: "Operation successfully completed.", // String of view
    duration: kDefaultAnimationDuration, // Duration to show before closing automatically, default: 2.0
    completeText: "Done", // Optional button value, default: ""
    style: .Success // Styles - see below.
)

// Add buttons
let alert = SCLAlertView()
alert.addButton("First Button", target:self, selector:Selector("firstButton"))
alert.addButton("Second Button") {
    println("Second button tapped")
}
alert.showSuccess(self, title: "Button View", subTitle: "This alert view has buttons")

// Add a text field
let alert = SCLAlertView()
let txt = alert.addTextField(title:"Enter your name")
alert.addButton("Show Name") {
    println("Text value: \(txt.text)")
}
alert.showEdit(self, title: "Edit View", subTitle: "This alert view shows a text box")
```

####Alert View Styles
```swift
enum SCLAlertViewStyle: Int {
    case Success, Error, Notice, Warning, Info, Edit
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
- Performance tests

Has been developed initially for the [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

- Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max
- Development [@hackua](https://twitter.com/hackua) Viktor Radchenko
- Improvements by [@bih](http://github.com/bih) Bilawal Hameed, [@rizjoj](http://github.com/rizjoj) Riz Joj 
