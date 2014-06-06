SCPopUpView
===========

Animated Popup View. Swift

![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/errorScreenshot.png). 
![BackgroundImage](https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png)

##Easy to use !
```swift
SCPopUpView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewSuccess)
```

Main methods :

```swift
//initialisation with a Title and a Subtitle message
SCPopUpView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewSuccess)
```

Four types of popup views (for now)

```swift
enum SCPopUpViewStyle: Int {
    case SCPopUpViewSuccess
    case SCPopUpViewError
    case SCPopUpViewNotice
    case SCPopUpViewWarning
    case SCPopUpViewInfo
}
```

Has been developted initialy for [Scroll Feed](https://itunes.apple.com/us/app/scroll-feed/id842422195?ls=1&mt=8) app

Design [@SherzodMx](https://twitter.com/SherzodMx) Sherzod Max

Developement [@hackua](https://twitter.com/hackua) Viktor Radchenko
