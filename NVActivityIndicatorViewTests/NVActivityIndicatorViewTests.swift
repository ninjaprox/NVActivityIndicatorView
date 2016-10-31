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
