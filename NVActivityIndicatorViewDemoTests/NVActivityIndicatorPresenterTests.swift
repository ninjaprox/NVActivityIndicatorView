//
//  NVActivityIndicatorPresenterTests.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 9/6/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import XCTest
@testable import NVActivityIndicatorView

class NVActivityIndicatorPresenterTests: XCTestCase {
    let approximateZero:Int64 = 5
    
    func testZeroDisplayTimeThreshold() {
        let activityData = ActivityData(size: CGSizeZero,
                                        message: "",
                                        type: nil,
                                        color: nil,
                                        padding: 0,
                                        displayTimeThreshold: 0,
                                        minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testNonZeroDisplayTimeThreshold() {
        let activityData = ActivityData(size: CGSizeZero,
                                        message: "",
                                        type: nil,
                                        color: nil,
                                        padding: 0,
                                        displayTimeThreshold: 100,
                                        minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(activityData)
        self.doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
        }
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(activityData)
        self.doAfter(150) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testZeroMinimumVisibleTime() {
        let activityData = ActivityData(size: CGSizeZero,
                                        message: "",
                                        type: nil,
                                        color: nil,
                                        padding: 0,
                                        displayTimeThreshold: 0,
                                        minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testNonZeroMinimumVisibleTime() {
        let activityData = ActivityData(size: CGSizeZero,
                                        message: "",
                                        type: nil,
                                        color: nil,
                                        padding: 0,
                                        displayTimeThreshold: 0,
                                        minimumDisplayTime: 100)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
        self.doAfter(50) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        self.doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    // MARK: Helpers
    
    func createActivityData(displayTimeThreshold displayTimeThreshold: Int,
                                                 minimumDisplayTime: Int) -> ActivityData {
        return ActivityData(size: CGSizeZero,
                            message: "",
                            type: nil,
                            color: nil,
                            padding: 0,
                            displayTimeThreshold: displayTimeThreshold,
                            minimumDisplayTime: minimumDisplayTime)
    }
    
    func checkActivityViewAppeared() -> Bool {
        for item in UIApplication.sharedApplication().keyWindow!.subviews
            where item.restorationIdentifier == "NVActivityIndicatorViewContainer" {
                return true
        }
        
        return false
    }
    
    func doAfter(after: Int64, thing: () -> Void) {
        let expectation = self.expectationWithDescription("")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC) * after), dispatch_get_main_queue()) {
            thing()
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(Double(after) * 1.5 / 1000) { (error) in
            print(error)
        }
    }
}
