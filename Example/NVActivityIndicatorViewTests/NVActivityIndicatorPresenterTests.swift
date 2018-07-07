//
//  NVActivityIndicatorPresenterTests.swift
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

class NVActivityIndicatorPresenterTests: XCTestCase {
    let approximateZero: Int = 20

    func testZeroDisplayTimeThreshold() {
        let activityData = createActivityData(displayTimeThreshold: 0,
                                              minimumDisplayTime: 0)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(approximateZero) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }

    func testNonZeroDisplayTimeThreshold() {
        let activityData = createActivityData(displayTimeThreshold: 100,
                                              minimumDisplayTime: 0)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(approximateZero) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }

        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(100) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(approximateZero) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }

    func testZeroMinimumDisplayTime() {
        let activityData = createActivityData(displayTimeThreshold: 0,
                                              minimumDisplayTime: 0)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(approximateZero) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }

    func testNonZeroMinimumDisplayTime() {
        let activityData = createActivityData(displayTimeThreshold: 0,
                                              minimumDisplayTime: 100)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(50) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }

    func testStartStop() {
        let activityData = createActivityData(displayTimeThreshold: 0,
                                              minimumDisplayTime: 0)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(approximateZero) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }

    func testStartStopStart() {
        let activityData = createActivityData(displayTimeThreshold: 0,
                                              minimumDisplayTime: 0)

        XCTAssertFalse(checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)

        doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        }

        doAfter(approximateZero * 2) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }

        doAfter(approximateZero * 3) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }

    }

    func testIsAnimating() {
        let activityData = createActivityData(displayTimeThreshold: 100,
                                              minimumDisplayTime: 100)

        // .stopped
        XCTAssertFalse(NVActivityIndicatorPresenter.sharedInstance.isAnimating)

        // .waitingToStart
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        doAfter(50) {
            XCTAssertFalse(NVActivityIndicatorPresenter.sharedInstance.isAnimating)
        }

        // .animating
        doAfter(50) {
            XCTAssertTrue(NVActivityIndicatorPresenter.sharedInstance.isAnimating)
        }

        // .waitingToStop
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        doAfter(50) {
            XCTAssertTrue(NVActivityIndicatorPresenter.sharedInstance.isAnimating)
        }

        // .stopped
        doAfter(50) {
            XCTAssertFalse(NVActivityIndicatorPresenter.sharedInstance.isAnimating)
        }
    }

    // MARK: Helpers

    func createActivityData(displayTimeThreshold: Int,
                            minimumDisplayTime: Int) -> ActivityData {
        return ActivityData(size: CGSize.zero,
                            message: "",
                            type: nil,
                            color: nil,
                            padding: 0,
                            displayTimeThreshold: displayTimeThreshold,
                            minimumDisplayTime: minimumDisplayTime,
                            textColor: nil)
    }

    func checkActivityViewAppeared() -> Bool {
        for item in UIApplication.shared.keyWindow!.subviews
            where item.restorationIdentifier == "NVActivityIndicatorViewContainer" {
                return true
        }

        return false
    }

    func doAfter(_ after: Int, thing: @escaping () -> Void) {
        let expectation = self.expectation(description: "")

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(after)) {
            thing()
            expectation.fulfill()
        }
        waitForExpectations(timeout: Double(after) * 1.5 / 1000) { error in
            print(error ?? "Timeout")
        }
    }
}
