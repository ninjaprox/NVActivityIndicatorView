NVActivityIndicatorView
===================

# Introduction
NVActivityIndicatorView is a collection of nice loading animations.

This is original a fork from [DGActivityIndicatorView](https://github.com/gontovnik/DGActivityIndicatorView), inspired by [Loaders.css](https://github.com/ConnorAtherton/loaders.css), written in Swift with full implementation of animations.

You can also find Objective-C version of this [here](https://github.com/ninjaprox/DGActivityIndicatorView).

# Demo
![alt tag](https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif)

For first-hand experience, just open the project and run it.

# Installation

## Cocoapods

Install Cocoapods if need be

```bash
$ gem install cocoapods
```

Add NVActivityIndicatorView in your `Podfile`

```bash
use_frameworks!

pod 'NVActivityIndicatorView'
```

Then, run the following command

```bash
$ pod install
```

## Manual

Copy NVActivityIndicatorView folder to your project. That's it.

# Usage

Firstly, import NVActivityIndicatorView

```swift
import NVActivityIndicatorView
```

Then, there are multiple ways you can create NVActivityIndicatorView:

- Use it in storyboard by changing class of any `UIView` to `NVActivityIndicatorView`
This will use default values 40, white, .Pacman for size, color and type respectively.

- Create with specified type, color and size

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color, size: size)
```

Any of the last three arguments can be omitted. If an argument is omitted it will use the default values which are 40, white, .Pacman for size, color and type respectively.
Therefore, you can also create NVActivityIndicatorView using any of the following:

- specify only frame, type and color
```swift
NVActivityIndicatorView(frame: frame, type: type, color: color)
```

- specify only frame, type and size
```swift
NVActivityIndicatorView(frame: frame, type: type, size: size)
```

- specify only frame, size and color
```swift
NVActivityIndicatorView(frame: frame, size: size, color: color)
```

- specify only frame and type
```swift
NVActivityIndicatorView(frame: frame, type: type)
```

- specify only frame and color
```swift
NVActivityIndicatorView(frame: frame, color: color)
```

- specify only frame and size
```swift
NVActivityIndicatorView(frame: frame, size: size)
```

- specify only frame
```swift
NVActivityIndicatorView(frame: frame)
```

# Acknowledgment

Thanks [Connor Atherton](https://github.com/ConnorAtherton) for great loaders and [Danil Gontovnik](https://github.com/gontovnik) for kick-start.

# License

The MIT License (MIT)

Copyright (c) 2015 Nguyen Vinh [@ninjaprox](http://twitter.com/ninjaprox)
