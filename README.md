SCLAlertView
===========

[![Version](https://img.shields.io/cocoapods/v/SCLAlertView.svg?style=flat)](http://cocoadocs.org/docsets/SCLAlertView/)


Animated Alert View written in Swift, which can be used as a `UIAlertView` or `UIAlertController` replacement. Since `UIAlertView` is deprecated and `UIAlertController` only works on iOS 8.x or above, if you have a Swift project where you want to support iOS 7.x too, SCLAlertView is an ideal substitution.

![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png)_
![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/editScreenshot.png)

Easy to use
----

### Get Started

```swift
// Get started
SCLAlertView().showInfo("Important info", subTitle: "You are great")
```

### Updating the alert view

```swift
let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello World", subTitle: "This is a more descriptive text.")

// Upon displaying, change/close view
alertViewResponder.setTitle("New Title") // Rename title
alertViewResponder.setSubTitle("New description") // Rename subtitle
alertViewResponder.close() // Close view
```

### Alternative alert types

```
SCLAlertView().showError("Hello Error", subTitle: "This is a more descriptive error text.") // Error
SCLAlertView().showNotice("Hello Notice", subTitle: "This is a more descriptive notice text.") // Notice
SCLAlertView().showWarning("Hello Warning", subTitle: "This is a more descriptive warning text.") // Warning
SCLAlertView().showInfo("Hello Info", subTitle: "This is a more descriptive info text.") // Info
SCLAlertView().showEdit("Hello Edit", subTitle: "This is a more descriptive info text.") // Edit
```

### Raw call to showTitle()

```swift
SCLAlertView().showTitle(
    "Congratulations", // Title of view
    subTitle: "Operation successfully completed.", // String of view
    duration: 2.0, // Duration to show before closing automatically, default: 0.0
    completeText: "Done", // Optional button value, default: ""
    style: .Success, // Styles - see below.
    colorStyle: 0xA429FF,
    colorTextButton: 0xFFFFFF
)
```

### Controls

#### Custom Appearance

```swift
// SCLAlertView.SCLAppearanc has more than 15 different properties to customize. See below.

let appearance = SCLAlertView.SCLAppearance(
    kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
    kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
    kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
    showCloseButton: false
)

let alert = SCLAlertView(appearance: appearance)
```

#### Add buttons

```swift
let alertView = SCLAlertView()
alertView.addButton("First Button", target:self, selector:Selector("firstButton"))
alertView.addButton("Second Button") {
    println("Second button tapped")
}
alertView.showSuccess("Button View", subTitle: "This alert view has buttons")
```

#### Hide default close button

```swift
let appearance = SCLAlertView.SCLAppearance(
    showCloseButton: false
)
let alertView = SCLAlertView(appearance: appearance)
alertView.showSuccess("No button", subTitle: "You will have hard times trying to close me")
```

#### Hide default close button & a duration to close the alert

```swift
let appearance = SCLAlertView.SCLAppearance(
    showCloseButton: false
)
let alertView = SCLAlertView(appearance: appearance)
alertView.showWarning("No button", subTitle: "Just wait for 3 seconds and I will disappear", duration: 3)
```


#### Hide alert icon

```swift
let appearance = SCLAlertView.SCLAppearance(
    showCircularIcon: false
)
let alert = SCLAlertView(appearance: appearance)
alertView.showSuccess("No icon", subTitle: "This is a clean alert without Icon!")
```

#### Use a custom icon

```swift
let appearance = SCLAlertView.SCLAppearance(
    showCircularIcon: true
)
let alert = SCLAlertView(appearance: appearance)
let alertViewIcon = UIImage(named: "IconImage") //Replace the IconImage text with the image name
alertView.showInfo("Custom icon", subTitle: "This is a nice alert with a custom icon you choose", circleIconImage: alertViewIcon)
```


#### Add Text fields

```swift
// Add a text field
let alert = SCLAlertView()
let txt = alert.addTextField(title:"Enter your name")
alert.addButton("Show Name") {
    println("Text value: \(txt.text)")
}
alert.showEdit("Edit View", subTitle: "This alert view shows a text box")
```

#### Use a custom subview instead of a subtitle
```swift
// Example of using the view to add two text fields to the alert
// Create the subview
let appearance = SCLAlertView.SCLAppearance(
    kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
    kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
    kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
    showCloseButton: false
)

// Initialize SCLAlertView using custom Appearance
let alert = SCLAlertView(appearance: appearance)

// Creat the subview
let subview = UIView(frame: CGRectMake(0,0,216,70))
let x = (subview.frame.width - 180) / 2

// Add textfield 1
let textfield1 = UITextField(frame: CGRectMake(x,10,180,25))
textfield1.layer.borderColor = UIColor.greenColor().CGColor
textfield1.layer.borderWidth = 1.5
textfield1.layer.cornerRadius = 5
textfield1.placeholder = "Username"
textfield1.textAlignment = NSTextAlignment.Center
subview.addSubview(textfield1)

// Add textfield 2
let textfield2 = UITextField(frame: CGRectMake(x,textfield1.frame.maxY + 10,180,25))
textfield2.secureTextEntry = true
textfield2.layer.borderColor = UIColor.blueColor().CGColor
textfield2.layer.borderWidth = 1.5
textfield2.layer.cornerRadius = 5
textfield1.layer.borderColor = UIColor.blueColor().CGColor
textfield2.placeholder = "Password"
textfield2.textAlignment = NSTextAlignment.Center
subview.addSubview(textfield2)

// Add the subview to the alert's UI property
alert.customSubview = subview
alert.addButton("Login") {
    print("Logged in")
}

// Add Button with Duration Status and custom Colors
alert.addButton("Duration Button", backgroundColor: UIColor.brownColor(), textColor: UIColor.yellowColor(), showDurationStatus: true) {
    print("Duration Button tapped")
}

alert.showInfo("Login", subTitle: "", duration: 10)
```


#### List of properties to customize

````swift
// Button 
kButtonFont: UIFont                     
buttonCornerRadius : CGFloat            
showCloseButton: Bool                   
kButtonHeight: CGFloat                  

// Circle Image
showCircularIcon: Bool
kCircleTopPosition: CGFloat
kCircleBackgroundTopPosition: CGFloat
kCircleHeight: CGFloat
kCircleIconHeight: CGFloat

// Text
kTitleFont: UIFont
kTitleTop:CGFloat
kTitleHeight:CGFloat
kTextFont: UIFont
kTextHeight: CGFloat
kTextFieldHeight: CGFloat
kTextViewdHeight: CGFloat

// View 
kDefaultShadowOpacity: CGFloat          
kWindowWidth: CGFloat
kWindowHeight: CGFloat
shouldAutoDismiss: Bool // Set this false to 'Disable' Auto hideView when SCLButton is tapped
fieldCornerRadius : CGFloat
contentViewCornerRadius : CGFloat
```


### Alert View Styles

```swift
enum SCLAlertViewStyle: Int {
    case Success, Error, Notice, Warning, Info, Edit, Wait
}
```


### Alert show animation Styles

```swift
// Animation Styles
public enum SCLAnimationStyle {
    case NoAnimation, TopToBottom, BottomToTop, LeftToRight, RightToLeft
}
```


Installation
---

SCLAlertView is available through [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'SCLAlertView'

Collaboration
---

I tried to build an easy to use API, while beeing flexible enough for multiple variations, but I'm sure there are ways of improving and adding more features, so feel free to collaborate with ideas, issues and/or pull requests.

Incoming improvements
---

- More animations
- Performance tests

Has been developed initially for the [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

- Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max
- Development [@vikmeup](https://twitter.com/vikmeup) Viktor Radchenko
- Improvements by [@bih](http://github.com/bih) Bilawal Hameed, [@rizjoj](http://github.com/rizjoj) Riz Joj
