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
    var activityData: ActivityData!
    
    override func setUp() {
        super.setUp()
        
        self.activityData = ActivityData(size: CGSizeZero, message: "", type: nil, color: nil, padding: 0, minimumVisibleTime: 0, displayTimeThreshold: 0)
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
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
        XCTAssertFalse(self.checkActivityViewAppeared())
    }
    
    // minimumVisiableTime = 0
    // displayTimeThreshold = 100
    func testDelay10() {
        self.activityData = ActivityData(size: CGSizeZero,
                                         message: "",
                                         type: nil,
                                         color: nil,
                                         padding: 0,
                                         minimumVisibleTime: 0,
                                         displayTimeThreshold: 100)
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(self.activityData)
        self.doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
        }
    }
    
    // MARK: Helpers
    
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
        self.waitForExpectationsWithTimeout(Double(after) * 1.2 / 1000) { (error) in
            print(error)
        }
    }
}
