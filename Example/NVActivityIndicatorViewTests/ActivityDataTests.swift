//
//  ActivityDataTests.swift
//  NVActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
@testable import NVActivityIndicatorView

class ActivityDataTests: XCTestCase {

    func testInitWithoutParams() {
        let activityData = ActivityData(controller: UIViewController())

        XCTAssertEqual(activityData.size, NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE)
        XCTAssertNil(activityData.message)
        XCTAssertEqual(activityData.type, NVActivityIndicatorView.DEFAULT_TYPE)
        XCTAssertEqual(activityData.color, NVActivityIndicatorView.DEFAULT_COLOR)
        XCTAssertEqual(activityData.padding, NVActivityIndicatorView.DEFAULT_PADDING)
        XCTAssertEqual(activityData.displayTimeThreshold, NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD)
        XCTAssertEqual(activityData.minimumDisplayTime, NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME)
        XCTAssertEqual(activityData.backgroundColor, NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR)
    }

    func testInitWithParams() {

        let size = CGSize(width: 100, height: 100)
        let message = "Loading..."
        let type = NVActivityIndicatorType.ballBeat
        let color = UIColor.red
        let padding: CGFloat = 10
        let displayTimeThreshold = 100
        let minimumDisplayTime = 150
        let backgroundColor = UIColor.red
        let textColor = UIColor.purple
        let activityData = ActivityData(size: size,
                                        message: message,
                                        type: type,
                                        color: color,
                                        padding: padding,
                                        displayTimeThreshold: displayTimeThreshold,
                                        minimumDisplayTime: minimumDisplayTime,
                                        backgroundColor: backgroundColor,
                                        textColor: textColor,
                                        controller: UIViewController())

        XCTAssertEqual(activityData.size, size)
        XCTAssertEqual(activityData.message, message)
        XCTAssertEqual(activityData.type, type)
        XCTAssertEqual(activityData.color, color)
        XCTAssertEqual(activityData.padding, padding)
        XCTAssertEqual(activityData.displayTimeThreshold, displayTimeThreshold)
        XCTAssertEqual(activityData.minimumDisplayTime, minimumDisplayTime)
        XCTAssertEqual(activityData.backgroundColor, backgroundColor)
        XCTAssertEqual(activityData.textColor, textColor)
    }

    func testTextColorInitWithColor() {

        let color = UIColor.red
        let activityData = ActivityData(color: color, controller: UIViewController())

        XCTAssertEqual(activityData.color, color)
        XCTAssertEqual(activityData.textColor, color) // textColor matches color
    }

    func testNoColorOrTextColorInit() {

        let activityData = ActivityData(controller: UIViewController())

        XCTAssertEqual(activityData.textColor, NVActivityIndicatorView.DEFAULT_TEXT_COLOR)
    }
}
