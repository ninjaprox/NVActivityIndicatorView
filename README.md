NVActivityIndicatorView
=======================

[![Build Status](https://travis-ci.org/ninjaprox/NVActivityIndicatorView.svg?branch=master)](https://travis-ci.org/ninjaprox/NVActivityIndicatorView)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

## Introduction
`NVActivityIndicatorView` is a collection of awesome loading animations.

This is original a fork from [DGActivityIndicatorView](https://github.com/gontovnik/DGActivityIndicatorView), inspired by [Loaders.css](https://github.com/ConnorAtherton/loaders.css), written in Swift with full implementation of animations, plus more.

You can also find Objective-C version of this [here](https://github.com/ninjaprox/DGActivityIndicatorView).

## Demo
![alt tag](https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif)

For first-hand experience, just open the project and run it.

## Animation types

| Type | Type | Type | Type |
|---|---|---|---|
|1. ballPulse | 2. ballGridPulse | 3. ballClipRotate | 4. squareSpin|
|5. ballClipRotatePulse | 6. ballClipRotateMultiple | 7. ballPulseRise | 8. ballRotate|
|9. cubeTransition | 10. ballZigZag | 11. ballZigZagDeflect | 12. ballTrianglePath|
|13. ballScale | 14. lineScale | 15. lineScaleParty | 16. ballScaleMultiple|
|17. ballPulseSync | 18. ballBeat | 19. lineScalePulseOut | 20. lineScalePulseOutRapid|
|21. ballScaleRipple | 22. ballScaleRippleMultiple | 23. ballSpinFadeLoader | 24. lineSpinFadeLoader|
|25. triangleSkewSpin | 26. pacman | 27. ballGridBeat | 28. semiCircleSpin|
|29. ballRotateChase | 30. orbit | 31. audioEqualizer | 32. circleStrokeSpin|

## Installation

### Cocoapods

Install [Cocoapods](https://cocoapods.org/#install) if need be.

```bash
$ gem install cocoapods
```

Add `NVActivityIndicatorView` in your `Podfile`.

```ruby
use_frameworks!

pod 'NVActivityIndicatorView'
```

If you're using `NVActivityIndicatorView` in an app extension, use `NVActivityIndicatorView/AppExtension` instead.

```ruby
use_frameworks!

pod 'NVActivityIndicatorView/AppExtension'
```

Then, run the following command.

```bash
$ pod install
```

_**Note:** Please refer to the migration note for version [`3.7.0`](#version-370) below._

### Carthage

Install [Carthage](https://github.com/Carthage/Carthage#installing-carthage) if need be.

```bash
$ brew update
$ brew install carthage
```

Add `NVActivityIndicatorView` in your `Cartfile`.

```ruby
github "ninjaprox/NVActivityIndicatorView"
```

Run `carthage` to build the framework and drag the built `NVActivityIndicatorView.framework` in the folder appropriateto the platform, e.g. iOS, tvOS, into your Xcode project.

_**Note:** You might encounter compile issue, if so please use `carthage` branch instead. Check issue [#101](https://github.com/ninjaprox/NVActivityIndicatorView/issues/101) for more information._

### Manual

Copy `NVActivityIndicatorView` folder to your project. That's it.

_**Note:** Make sure that all files in `NVActivityIndicatorView` included in Compile Sources in Build Phases._

_**Note:** If you encounter issues while uploading the app to iTunes Connect, remove the `Info.plist` file in `NVActivityIndicatorView`. Check issue [#129](https://github.com/ninjaprox/NVActivityIndicatorView/issues/129) for more information._

## Migration

### Version 4.4.0

This version requires Xcode 10.1 and Swift 4.2.

### Version 4.0.0

This version requires Xcode 9.0 and Swift 4.

### Version 3.7.0

This version splits `NVActivityIndicatorView` pod to 2 subpods `NVActivityIndicatorView/Presenter` and `NVActivityIndicatorView/AppExtension`. There is no need to change `pod NVActivityIndicatorView` to `pod NVActivityIndicatorView/Presenter` since it will be installed by default if you use the main pod name.

However, if you want to use `NVActivityIndicatorView` in an app extension, use `pod NVActivityIndicatorView/AppExtension` instead.

_**Note:** Related issue [#119](https://github.com/ninjaprox/NVActivityIndicatorView/issues/119)._

## Usage

Firstly, import `NVActivityIndicatorView`.

```swift
import NVActivityIndicatorView
```

### Initialization

Then, there are two ways you can create `NVActivityIndicatorView`:

- By storyboard, changing class of any `UIView` to `NVActivityIndicatorView`.

_**Note:** Set Module to `NVActivityIndicatorView`._

- By code, using initializer. All parameters other than `frame` are optional and `NVActivityIndicatorView.DEFAULT_*` are used as default values.

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
```

### Control

Start animating.

```swift
activityIndicatorView.startAnimating()
```

Stop animating.

```swift
activityIndicatorView.stopAnimating()
```

Determine if it is animating.

```swift
animating = activityIndicatorView.isAnimating
```

### Change properties

In storyboard, you can change all properties in Attributes inspector tab of Utilities panel.

_**Note:** Use one of values (case-insensitive) in [Animation types](#animation-types) for `Type Name`._

All properties are public so you can change them after initializing.

_**Note:** All changes must be made before calling `startAnimating()`._

### UI blocker

By conforming `NVActivityIndicatorViewable` protocol, you can use `NVActivityIndicatorView` as UI blocker for `UIViewController`.

```swift
class ViewController: UIViewController, NVActivityIndicatorViewable { }
```

Start animating.

```swift
startAnimating(size, message) // plus other parameters as in initializer.
```

Stop animating.

```swift
stopAnimating()
```

Check if it is animating.

```swift
animating = isAnimating
```

Or you can use `NVActivityIndicatorPresenter` to display UI blocker anywhere.

Start animating.

```swift
let activityData = ActivityData()

NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
```

_**Note:** Check [documentation](https://nvactivityindicatorview.vinhis.me) for detail of `ActivityData`._

Stop animating.

```swift
NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
```

Change message.

```swift
NVActivityIndicatorPresenter.sharedInstance.setMessage("Done")
```

Check if it is animating.

```swift
animating = NVActivityIndicatorPresenter.sharedInstance.isAnimating
```

#### Fade in/out animation

You have control over showing and hiding UI blocker animation.

```swift
startAnimating(fadeInAnimation: fadeInAnimation)
stopAnimating(fadeOutAnimation)
```

Check `DEFAULT_FADE_IN_ANIMATION` and `DEFAULT_FADE_OUT_ANIMATION` for examples of how to implement animation.

## Acknowledgment

Thanks [Connor Atherton](https://github.com/ConnorAtherton) for great loaders and [Danil Gontovnik](https://github.com/gontovnik) for kick-start.

## License

The MIT License (MIT)

Copyright (c) 2016 Vinh Nguyen [@ninjaprox](http://twitter.com/ninjaprox)
