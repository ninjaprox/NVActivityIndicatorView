//
//  ActivityDataTests.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 9/7/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import XCTest
@testable import NVActivityIndicatorView

class ActivityDataTests: XCTestCase {
    
    func testInitWithoutParams() {
        let activityData = ActivityData()
        
        XCTAssertEqual(activityData.size, NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE)
        XCTAssertNil(activityData.message)
        XCTAssertEqual(activityData.type, NVActivityIndicatorView.DEFAULT_TYPE)
        XCTAssertEqual(activityData.color, NVActivityIndicatorView.DEFAULT_COLOR)
        XCTAssertEqual(activityData.padding, NVActivityIndicatorView.DEFAULT_PADDING)
        XCTAssertEqual(activityData.displayTimeThreshold, NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD)
        XCTAssertEqual(activityData.minimumDisplayTime, NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME)
    }
    
    func testInitWithParams() {
        let size = CGSize(width: 100, height: 100)
        let message = "Loading..."
        let type = NVActivityIndicatorType.ballBeat
        let color = UIColor.red
        let padding: CGFloat = 10
        let displayTimeThreshold = 100
        let minimumDisplayTime = 150
        let activityData = ActivityData(size: size,
                                        message: message,
                                        type: type,
                                        color: color,
                                        padding: padding,
                                        displayTimeThreshold: displayTimeThreshold,
                                        minimumDisplayTime: minimumDisplayTime)
        
        XCTAssertEqual(activityData.size, size)
        XCTAssertEqual(activityData.message, message)
        XCTAssertEqual(activityData.type, type)
        XCTAssertEqual(activityData.color, color)
        XCTAssertEqual(activityData.padding, padding)
        XCTAssertEqual(activityData.displayTimeThreshold, displayTimeThreshold)
        XCTAssertEqual(activityData.minimumDisplayTime, minimumDisplayTime)
    }
}
