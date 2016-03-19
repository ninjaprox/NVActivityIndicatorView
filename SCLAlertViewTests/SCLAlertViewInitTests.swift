//
//  SCLAlertViewTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 19/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

import XCTest

class SCLAlertViewInitTests: XCTestCase {

    let alert = SCLAlertView()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSCLAlertViewShadowOpacity() {
        XCTAssertTrue(alert.kDefaultShadowOpacity == 0.7)
    }
    
    func testSCLAlertViewCircleTopPosition() {
        XCTAssertTrue(alert.kCircleTopPosition == -12.0)
    }
    
    func testSCLAlertViewBackgroundTopPosition() {
        XCTAssertTrue(alert.kCircleBackgroundTopPosition == -15.0)
    }
    
    func testSCLAlertViewCircleHeight() {
        XCTAssertTrue(alert.kCircleHeight == 56.0)
    }
    
    func testSCLAlertViewIconHeight() {
        XCTAssertTrue(alert.kCircleIconHeight == 20.0)
    }
    
    func testSCLAlertViewTitleTop() {
        XCTAssertTrue(alert.kTitleTop == 30.0)
    }
    
    func testSCLAlertViewTitleHeight() {
        XCTAssertTrue(alert.kTitleHeight == 40.0)
    }
    
    func testSCLAlertViewWindowWidth() {
        XCTAssertTrue(alert.kWindowWidth == 240.0)
    }
    
    func testSCLAlertViewWindowHeight() {
        XCTAssertTrue(alert.kWindowHeight == 178.0)
    }
    
    func testSCLAlertViewTextHeight() {
        XCTAssertTrue(alert.kTextHeight == 90.0)
    }
    
    func testSCLAlertViewTextFieldHeight() {
        XCTAssertTrue(alert.kTextFieldHeight == 45.0)
    }
    
    func testSCLAlertViewTextButtonHeight() {
        XCTAssertTrue(alert.kButtonHeight == 45.0)
    }
}

