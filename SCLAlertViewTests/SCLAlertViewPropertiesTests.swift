//
//  SCLAlertViewTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 19/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import XCTest

class SCLAlertViewPropertiesTests: XCTestCase {

    let alert = SCLAlertView()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSCLAlertViewShadowOpacity() {
        XCTAssertTrue(alert.appearance.kDefaultShadowOpacity == 0.7)
    }
    
    func testSCLAlertViewCircleTopPosition() {
        XCTAssertTrue(alert.appearance.kCircleTopPosition == -12.0)
    }
    
    func testSCLAlertViewBackgroundTopPosition() {
        XCTAssertTrue(alert.appearance.kCircleBackgroundTopPosition == -15.0)
    }
    
    func testSCLAlertViewCircleHeight() {
        XCTAssertTrue(alert.appearance.kCircleHeight == 56.0)
    }
    
    func testSCLAlertViewIconHeight() {
        XCTAssertTrue(alert.appearance.kCircleIconHeight == 20.0)
    }
    
    func testSCLAlertViewTitleTop() {
        XCTAssertTrue(alert.appearance.kTitleTop == 30.0)
    }
    
    func testSCLAlertViewTitleHeight() {
        XCTAssertTrue(alert.appearance.kTitleHeight == 40.0)
    }
    
    func testSCLAlertViewWindowWidth() {
        XCTAssertTrue(alert.appearance.kWindowWidth == 240.0)
    }
    
    func testSCLAlertViewWindowHeight() {
        XCTAssertTrue(alert.appearance.kWindowHeight == 178.0)
    }
    
    func testSCLAlertViewTextHeight() {
        XCTAssertTrue(alert.appearance.kTextHeight == 90.0)
    }
    
    func testSCLAlertViewTextFieldHeight() {
        XCTAssertTrue(alert.appearance.kTextFieldHeight == 45.0)
    }
    
    func testSCLAlertViewTextButtonHeight() {
        XCTAssertTrue(alert.appearance.kButtonHeight == 45.0)
    }
    
    func testSCLAlertViewTitleFont() {
        XCTAssertTrue(alert.appearance.kTitleFont == UIFont.systemFontOfSize(20))
    }
    
    func testSCLAlertViewTextFont() {
        XCTAssertTrue(alert.appearance.kTextFont == UIFont.systemFontOfSize(14))
    }
    
    func testSCLAlertViewButtonFont() {
        XCTAssertTrue(alert.appearance.kButtonFont == UIFont.boldSystemFontOfSize(14))
    }
        
    func testSCLAlertViewColor() {
        XCTAssertTrue(alert.viewColor.isKindOfClass(UIColor.self))
    }
    
    func testSCLAlertViewShowCloseButton() {
        XCTAssertTrue(alert.showCloseButton == true)
    }
    
    func testSCLAlertViewShowCircularIcon() {
        XCTAssertTrue(alert.showCircularIcon == true)
    }
    
    func testSCLAlertViewContentViewCornerRadius() {
        XCTAssertTrue(alert.contentViewCornerRadius == 5.0)
    }
    
    func testSCLAlertViewFieldCornerRadius() {
        XCTAssertTrue(alert.fieldCornerRadius == 3.0)
    }
    
    func testSCLAlertViewButtonCornerRadius() {
        XCTAssertTrue(alert.buttonCornerRadius == 3.0)
    }
    
    func testSCLAlertViewHideWhenBackgroundViewIsTapped() {
        XCTAssertTrue(alert.hideWhenBackgroundViewIsTapped == false)
    }
    
    func testSCLAlertViewBaseView() {
        XCTAssertTrue(alert.baseView.isKindOfClass(UIView.self))
    }
    
    func testSCLAlertViewLabelTitle() {
        XCTAssertTrue(alert.labelTitle.isKindOfClass(UILabel.self))
    }
    
    func testSCLAlertViewViewText() {
        XCTAssertTrue(alert.viewText.isKindOfClass(UITextView.self))
    }
    
    func testSCLAlertViewContentView() {
        XCTAssertTrue(alert.contentView.isKindOfClass(UIView.self))
    }
    
    func testSCLAlertViewCircleBG() {
        XCTAssertTrue(alert.circleBG.isKindOfClass(UIView.self))
        XCTAssertTrue(alert.circleBG.frame.origin.x == 0)
        XCTAssertTrue(alert.circleBG.frame.origin.y == 0)
        XCTAssertTrue(alert.circleBG.frame.size.width == kCircleHeightBackground)
        XCTAssertTrue(alert.circleBG.frame.size.height == kCircleHeightBackground)
    }
    
    func testSCLAlertViewCircleView() {
        XCTAssertTrue(alert.circleView.isKindOfClass(UIView.self))
    }
    
    func testSCLAlertViewCircleIconView() {
        if let iconView = alert.circleIconView {
            XCTAssertTrue(iconView.isKindOfClass(UIView.self))
        }else {
            XCTAssertTrue(alert.circleIconView == nil)
        }
    }
    
    func testSCLAlertViewDurationTimer() {
        if let timer = alert.durationTimer {
            XCTAssertTrue(timer.isKindOfClass(NSTimer.self))
        }else {
            XCTAssertTrue(alert.durationTimer == nil)
        }
    }
}
