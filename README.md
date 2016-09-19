NVActivityIndicatorView
===================

[![Build Status](https://travis-ci.org/ninjaprox/NVActivityIndicatorView.svg?branch=master)](https://travis-ci.org/ninjaprox/NVActivityIndicatorView)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Introduction
`NVActivityIndicatorView` is a collection of awesome loading animations.

This is original a fork from [DGActivityIndicatorView](https://github.com/gontovnik/DGActivityIndicatorView), inspired by [Loaders.css](https://github.com/ConnorAtherton/loaders.css), written in Swift with full implementation of animations, plus more.

You can also find Objective-C version of this [here](https://github.com/ninjaprox/DGActivityIndicatorView).

# Demo
![alt tag](https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif)

For first-hand experience, just open the project and run it.

# Animation types

| Type | Type | Type | Type |
|---|---|---|---|
1. BallPulse | 2. BallGridPulse | 3. BallClipRotate | 4. SquareSpin
5. BallClipRotatePulse | 6. BallClipRotateMultiple | 7. BallPulseRise | 8. BallRotate
9. CubeTransition | 10. BallZigZag | 11. BallZigZagDeflect | 12. BallTrianglePath
13. BallScale | 14. LineScale | 15. LineScaleParty | 16. BallScaleMultiple
17. BallPulseSync | 18. BallBeat | 19. LineScalePulseOut | 20. LineScalePulseOutRapid
21. BallScaleRipple | 22. BallScaleRippleMultiple | 23. BallSpinFadeLoader | 24. LineSpinFadeLoader
25. TriangleSkewSpin | 26. Pacman | 27. BallGridBeat | 28. SemiCircleSpin
29. BallRotateChase | 30. Orbit | 31. AudioEqualizer

# Installation

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `NVActivityIndicatorView` in your `Podfile`.

```ruby
use_frameworks!

pod 'NVActivityIndicatorView'
```

Then, run the following command.

```bash
$ pod install
```
## Carthage

Install Carthage if need be.

```bash
$ brew update
$ brew install carthage
```

Add `NVActivityIndicatorView` in your `Cartfile`.

```ruby
github "ninjaprox/NVActivityIndicatorView"
```

Run `carthage` to build the framework and drag the built `NVActivityIndicatorView.framework` into your Xcode project.

## Manual

Copy `NVActivityIndicatorView` folder to your project. That's it.

_**Note:** Make sure that all files in `NVActivityIndicatorView` included in Compile Sources in Build Phases.

# Migration

## Vesrion 3.0

This version requires Xcode 8.0 and Swift 3.

- `NVActivityIndicatorView.startAnimation()` and `NVActivityIndicatorView.stopAnimation()` are deleted. Use `NVActivityIndicatorView.startAnimating()` and `NVActivityIndicatorView.stopAnimating()` instead.
- `UIViewController.startActivityAnimating()` and `UIViewController.stopActivityAnimating()` are deleted. Use `UIViewController.startAnimating()` and `UIViewController.stopAnimating()` instead.

## Version 2.0

This version continues to spport Xcode 7.0 and Swift 2.2 and earlier.
For Swift 2.3 support, use `swift2.3` branch instead.

```ruby
pod 'NVActivityIndicatorView', :git => 'https://github.com/ninjaprox/NVActivityIndicatorView.git', :branch => 'swift2.3'
```

# Usage

Firstly, import `NVActivityIndicatorView`.

```swift
import NVActivityIndicatorView
```

## Initialization

Then, there are two ways you can create NVActivityIndicatorView:

- By storyboard, changing class of any `UIView` to `NVActivityIndicatorView`.

- By code, using initializer. All parameters other than `frame` are optional and `NVActivityIndicatorView.DEFAULT_*` are used as default values.

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
```

_**Note:** Check [DEFAULTS](#DEFAULTS) for default values._

## Control

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
animating = activityIndicatorView.animating
```

## Change properties

In storyboard, you can change all properties in Attributes inspector tab of Utilities panel.

_**Note:** Use one of values (case-insensitive) in [Animation types](#animation-types) for `Type Name`._

All properties are public so you can change them all after initiating.

_**Note:** All changes must be made before calling `startAnimating()`._

## UI blocker

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

Or you can use `NVActivityIndicatorPresenter` to display UI blocker anywhere.

Start animating.

```swift
let activityData = ActivityData()

NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
```

_**Note:** Check documentation for detail of `ActivityData`._

Stop animating.

```swift
NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
```

## DEFAULTS

There are global defaults for all `NVActivityIndicatorView` instances.

- Default animation type.

```swift
NVActivityIndicatorView.DEFAULT_TYPE = .BallSpinFadeLoader
```

- Default color of activity indicator view.

```swift
NVActivityIndicatorView.DEFAULT_COLOR = UIColor.whiteColor()
```

- Default padding of activity indicator view.

```swift
NVActivityIndicatorView.DEFAULT_PADDING = CGFloat(0)
```

- Default size of activity indicator view used in UI blocker.

```swift
NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = CGSizeMake(60, 60)
```

- Default display time threshold.

> Default time that has to be elapsed (between calls of `startAnimating()` and `stopAnimating()`) in order to actually display UI blocker. It should be set thinking about what the minimum duration of an activity is to be worth showing it to the user. If the activity ends before this time threshold, then it will not be displayed at all.

```swift
NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0 // in milliseconds
```

- Default minimum display time.

> Default minimum display time of UI blocker. Its main purpose is to avoid flashes showing and hiding it so fast. For instance, setting it to 200ms will force UI blocker to be shown for at least this time (regardless of calling `stopAnimating()` ealier).

```swift
NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0 // in milliseconds
```

# Acknowledgment

Thanks [Connor Atherton](https://github.com/ConnorAtherton) for great loaders and [Danil Gontovnik](https://github.com/gontovnik) for kick-start.

# License

The MIT License (MIT)

Copyright (c) 2016 Nguyen Vinh [@ninjaprox](http://twitter.com/ninjaprox)
