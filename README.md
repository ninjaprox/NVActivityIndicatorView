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
pod 'NVActivityIndicatorView'
```

Then, run the following command

```bash
$ pod install
```

## Manual

Copy NVActivityIndicatorView folder to your project. That's it.

# Usage

There are 3 ways you can do:

- Create with specified type and size 40, color white as default

```swift
NVActivityIndicatorView(frame: frame, type: type)
```

- Create with specified type, color and size 40 as default

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color)
```

- Create with specified type, color, size

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color, size: size)
```
# Acknowledgment

Thanks [Connor Atherton](https://github.com/ConnorAtherton) for great loaders and [Danil Gontovnik](https://github.com/gontovnik) for kick-start.

# License

The MIT License (MIT)

Copyright (c) 2015 Nguyen Vinh [@ninjaprox](http://twitter.com/ninjaprox)