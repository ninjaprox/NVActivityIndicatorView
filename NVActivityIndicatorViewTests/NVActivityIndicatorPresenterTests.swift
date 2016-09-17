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
    let approximateZero:Int64 = 20
    
    func testZeroDisplayTimeThreshold() {
        let activityData = self.createActivityData(displayTimeThreshold: 0,
                                                   minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testNonZeroDisplayTimeThreshold() {
        let activityData = self.createActivityData(displayTimeThreshold: 100,
                                                   minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        self.doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        self.doAfter(150) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testZeroMinimumDisplayTime() {
        let activityData = self.createActivityData(displayTimeThreshold: 0,
                                                   minimumDisplayTime: 0)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            XCTAssertFalse(self.checkActivityViewAppeared())
        }
    }
    
    func testNonZeroMinimumDisplayTime() {
        let activityData = self.createActivityData(displayTimeThreshold: 0,
                                                   minimumDisplayTime: 100)
        
        XCTAssertFalse(self.checkActivityViewAppeared())
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        self.doAfter(approximateZero) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        self.doAfter(50) {
            XCTAssertTrue(self.checkActivityViewAppeared())
        }
        self.doAfter(50) {
            XCTAssertFalse(self.checkActivityViewAppeared())
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
                            minimumDisplayTime: minimumDisplayTime)
    }
    
    func checkActivityViewAppeared() -> Bool {
        for item in UIApplication.shared.keyWindow!.subviews
            where item.restorationIdentifier == "NVActivityIndicatorViewContainer" {
                return true
        }
        
        return false
    }
    
    func doAfter(_ after: Int64, thing: @escaping () -> Void) {
        let expectation = self.expectation(description: "")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(NSEC_PER_MSEC * UInt64(after)) / Double(NSEC_PER_SEC)) {
            thing()
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: Double(after) * 1.5 / 1000) { (error) in
            print(error)
        }
    }
}
