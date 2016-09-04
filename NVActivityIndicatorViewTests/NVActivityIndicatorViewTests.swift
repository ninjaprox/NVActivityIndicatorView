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
    
    func testSetTypeName() {
        self.activityIndicatorView.setTypeName_("unknown")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorView.DEFAULT_TYPE)
        self.activityIndicatorView.setTypeName_("Orbit")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.Orbit)
        self.activityIndicatorView.setTypeName_("orbit")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.Orbit)
        self.activityIndicatorView.setTypeName_("orbiT")
        XCTAssertEqual(self.activityIndicatorView.type, NVActivityIndicatorType.Orbit)
    }
    
    func testGetTypeName() {
        self.activityIndicatorView.type = .AudioEqualizer
        XCTAssertEqual(self.activityIndicatorView.getTypeName(), String(NVActivityIndicatorType.AudioEqualizer))
    }
    
    func testInitWithParams() {
        let type: NVActivityIndicatorType = .AudioEqualizer
        let color = UIColor.redColor()
        let padding: CGFloat = 10
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRectZero, type: type)
        XCTAssertEqual(self.activityIndicatorView.type, type)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRectZero, color: color)
        XCTAssertEqual(self.activityIndicatorView.color, color)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRectZero, padding: padding)
        XCTAssertEqual(self.activityIndicatorView.padding, padding)
        
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRectZero, type: type, color: color, padding: padding)
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
        self.activityIndicatorView.startAnimating()
        XCTAssertEqual(self.activityIndicatorView.layer.speed, 1)
        XCTAssertTrue(self.activityIndicatorView.animating)
    }
}
