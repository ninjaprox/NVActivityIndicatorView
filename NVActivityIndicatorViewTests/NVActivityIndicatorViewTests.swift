//
//  NVActivityIndicatorViewTests.swift
//  NVActivityIndicatorViewTests
//
//  Created by Nguyen Vinh on 8/31/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import XCTest
@testable import NVActivityIndicatorView

class NVActivityIndicatorViewTests: XCTestCase {
    var activityIndicatorView: NVActivityIndicatorView! = nil
    
    override func setUp() {
        super.setUp()
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRectZero)
    }
    
    override func tearDown() {
        self.activityIndicatorView = nil
        
        super.tearDown()
    }
    
    func testDefaultValues() {
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_TYPE, NVActivityIndicatorType.BallSpinFadeLoader)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_COLOR, UIColor.whiteColor())
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_PADDING, 0)
        XCTAssertEqual(NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE, CGSize(width: 60, height: 60))
    }
}
