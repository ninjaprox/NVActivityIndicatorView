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
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero)
    }
    
    override func tearDown() {
        self.activityIndicatorView = nil
        
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
        self.activityIndicatorView._setTypeName("unknown")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorView.DEFAULT_TYPE)
        self.activityIndicatorView._setTypeName("Orbit")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.orbit)
        self.activityIndicatorView._setTypeName("orbit")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.orbit)
        self.activityIndicatorView._setTypeName("orbiT")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.orbit)
    }
    
    func testGetTypeName() {
        self.activityIndicatorView.type = .audioEqualizer
        XCTAssertEqual(self.activityIndicatorView.getTypeName(), String(describing: NVActivityIndicatorType.audioEqualizer))
    }
    
    func testInitWithParams() {
        let type: NVActivityIndicatorType = .audioEqualizer
        let color = UIColor.red
        let padding: CGFloat = 10
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type)
        XCTAssertEqual(self.activityIndicatorView.type, type)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, color: color)
        XCTAssertEqual(self.activityIndicatorView.color, color)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, padding: padding)
        XCTAssertEqual(self.activityIndicatorView.padding, padding)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type, color: color, padding: padding)
        XCTAssertEqual(self.activityIndicatorView.type, type)
        XCTAssertEqual(self.activityIndicatorView.color, color)
        XCTAssertEqual(self.activityIndicatorView.padding, padding)
    }
    
    func testInitWithFrame() {
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorView.DEFAULT_TYPE)
        XCTAssertEqual(self.activityIndicatorView.color, NVActivityIndicatorView.DEFAULT_COLOR)
        XCTAssertEqual(self.activityIndicatorView.padding, NVActivityIndicatorView.DEFAULT_PADDING)
    }
    
    func testStartAnimating() {
        XCTAssertFalse(self.activityIndicatorView.animating)
        XCTAssertTrue(self.activityIndicatorView.isHidden)
        self.activityIndicatorView.startAnimating()
        XCTAssertEqual(self.activityIndicatorView.layer.speed, 1)
        XCTAssertTrue(self.activityIndicatorView.animating)
        XCTAssertFalse(self.activityIndicatorView.isHidden)
    }
    
    func testStopAnimating() {
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.stopAnimating()
        XCTAssertFalse(self.activityIndicatorView.animating)
        XCTAssertTrue(self.activityIndicatorView.isHidden)
        XCTAssertTrue(self.activityIndicatorView.layer.sublayers == nil)
    }
}
