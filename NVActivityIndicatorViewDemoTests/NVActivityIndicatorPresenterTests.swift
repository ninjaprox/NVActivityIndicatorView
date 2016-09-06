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
    var activityData: ActivityData!
    
    override func setUp() {
        super.setUp()
        
        self.activityData = ActivityData(size: CGSizeZero, message: "", type: nil, color: nil, padding: 0, minimumVisibleTime: 0.1, displayTimeThreshold: 0.1)
    }
    
    override func tearDown() {
        self.activityData = nil
        
        super.tearDown()
    }
    
    // minimumVisiableTime = 0
    // displayTimeThreshold = 0
    func testDelay00() {
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(self.activityData)
        self.checkAfter(5, value: true)
        NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
        XCTAssertFalse(self.checkActivityViewAppeared())
    }
    
    func xtestDelay10() {
        let checkAfter: Int64 = 80
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(self.activityData)
        self.checkAfter(checkAfter, value: true)
    }
    
    // MARK: Helpers
    
    func checkActivityViewAppeared() -> Bool {
        for item in UIApplication.sharedApplication().keyWindow!.subviews
            where item.restorationIdentifier == "NVActivityIndicatorViewContainer" {
                return true
        }
        
        return false
    }
    
    func checkAfter(after: Int64, value: Bool) {
        let expectation = self.expectationWithDescription("")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC) * after), dispatch_get_main_queue()) {
            XCTAssertEqual(self.checkActivityViewAppeared(), value)
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(Double(after) * 1.2 / 1000) { (error) in
            print(error)
        }
    }
}
