SCLAlertView
===========

Animated Popup Aler View. Written in Swift

![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/errorScreenshot.png)_ 
![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png)

##Easy to use !
```swift
SCLAlertView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Success)
```

Main methods :

```swift
//initialisation with a Title and a Subtitle message
SCLAlertView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Success)
```

Four types of popup views (for now)

```swift
enum SCLAlertViewStyle: Int {
    case Success
    case Error
    case Notice
    case Warning
    case Info
}
```

Has been developted initialy for [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max

Developement [@hackua](https://twitter.com/hackua) Viktor Radchenko
