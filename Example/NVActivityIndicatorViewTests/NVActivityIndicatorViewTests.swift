//
//  NVActivityIndicatorViewTests.swift
//  NVActivityIndicatorViewTests
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

class NVActivityIndicatorViewTests: XCTestCase {
    var activityIndicatorView: NVActivityIndicatorView!

    override func setUp() {
        super.setUp()

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero)
    }

    override func tearDown() {
        activityIndicatorView = nil

        super.tearDown()
    }

    func testDefaultValues() {
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_TYPE, NVActivityIndicatorType.ballSpinFadeLoader)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_COLOR, UIColor.white)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_PADDING, 0)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE, CGSize(width: 60, height: 60))
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME, 0)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD, 0)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR, UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
    }

    func testSetTypeName() {
        activityIndicatorView._setTypeName("unknown")
        XCTAssertEqual(activityIndicatorView.type, NVActivityIndicatorView.DEFAULT_TYPE)
        activityIndicatorView._setTypeName("Orbit")
        XCTAssertEqual(activityIndicatorView.type, NVActivityIndicatorType.orbit)
        activityIndicatorView._setTypeName("orbit")
        XCTAssertEqual(activityIndicatorView.type, NVActivityIndicatorType.orbit)
        activityIndicatorView._setTypeName("orbiT")
        XCTAssertEqual(activityIndicatorView.type, NVActivityIndicatorType.orbit)
    }

    func testGetTypeName() {
        activityIndicatorView.type = .audioEqualizer
        XCTAssertEqual(activityIndicatorView.getTypeName(), String(describing: NVActivityIndicatorType.audioEqualizer))
    }

    func testInitWithParams() {
        let type: NVActivityIndicatorType = .audioEqualizer
        let color = UIColor.red
        let padding: CGFloat = 10

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type)
        XCTAssertEqual(activityIndicatorView.type, type)

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, color: color)
        XCTAssertEqual(activityIndicatorView.color, color)

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, padding: padding)
        XCTAssertEqual(activityIndicatorView.padding, padding)

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type, color: color, padding: padding)
        XCTAssertEqual(activityIndicatorView.type, type)
        XCTAssertEqual(activityIndicatorView.color, color)
        XCTAssertEqual(activityIndicatorView.padding, padding)
    }

    func testInitWithFrame() {
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        XCTAssertEqual(activityIndicatorView.type, NVActivityIndicatorView.DEFAULT_TYPE)
        XCTAssertEqual(activityIndicatorView.color, NVActivityIndicatorView.DEFAULT_COLOR)
        XCTAssertEqual(activityIndicatorView.padding, NVActivityIndicatorView.DEFAULT_PADDING)
    }

    func testStartAnimating() {
        XCTAssertFalse(activityIndicatorView.isAnimating)
        XCTAssertTrue(activityIndicatorView.isHidden)
        activityIndicatorView.startAnimating()
        XCTAssertEqual(activityIndicatorView.layer.speed, 1)
        XCTAssertTrue(activityIndicatorView.isAnimating)
        XCTAssertFalse(activityIndicatorView.isHidden)
    }

    func testStopAnimating() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.stopAnimating()
        XCTAssertFalse(activityIndicatorView.isAnimating)
        XCTAssertTrue(activityIndicatorView.isHidden)
        XCTAssertTrue(activityIndicatorView.layer.sublayers == nil)
    }
}
