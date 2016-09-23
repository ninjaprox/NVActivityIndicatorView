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
        XCTAssertTrue(alert.appearance.kTitleFont == UIFont.systemFont(ofSize: 20))
    }
    
    func testSCLAlertViewTextFont() {
        XCTAssertTrue(alert.appearance.kTextFont == UIFont.systemFont(ofSize: 14))
    }
    
    func testSCLAlertViewButtonFont() {
        XCTAssertTrue(alert.appearance.kButtonFont == UIFont.boldSystemFont(ofSize: 14))
    }
        
    func testSCLAlertViewColor() {
        XCTAssertTrue(alert.viewColor.isKind(of:UIColor.self))
    }
    
    func testSCLAlertViewShowCloseButton() {
        XCTAssertTrue(alert.appearance.showCloseButton == true)
    }
    
    func testSCLAlertViewShowCircularIcon() {
        XCTAssertTrue(alert.appearance.showCircularIcon == true)
    }
    
    func testSCLAlertViewContentViewCornerRadius() {
        XCTAssertTrue(alert.appearance.contentViewCornerRadius == 5.0)
    }
    
    func testSCLAlertViewFieldCornerRadius() {
        XCTAssertTrue(alert.appearance.fieldCornerRadius == 3.0)
    }
    
    func testSCLAlertViewButtonCornerRadius() {
        XCTAssertTrue(alert.appearance.buttonCornerRadius == 3.0)
    }
    
    func testSCLAlertViewHideWhenBackgroundViewIsTapped() {
        XCTAssertTrue(alert.appearance.hideWhenBackgroundViewIsTapped == false)
    }
    
    func testSCLAlertViewBaseView() {
        XCTAssertTrue(alert.baseView.isKind(of:UIView.self))
    }
    
    func testSCLAlertViewLabelTitle() {
        XCTAssertTrue(alert.labelTitle.isKind(of:UILabel.self))
    }
    
    func testSCLAlertViewViewText() {
        XCTAssertTrue(alert.viewText.isKind(of:UITextView.self))
    }
    
    func testSCLAlertViewContentView() {
        XCTAssertTrue(alert.contentView.isKind(of:UIView.self))
    }
    
    func testSCLAlertViewCircleBG() {
        XCTAssertTrue(alert.circleBG.isKind(of:UIView.self))
        XCTAssertTrue(alert.circleBG.frame.origin.x == 0)
        XCTAssertTrue(alert.circleBG.frame.origin.y == 0)
        XCTAssertTrue(alert.circleBG.frame.size.width == kCircleHeightBackground)
        XCTAssertTrue(alert.circleBG.frame.size.height == kCircleHeightBackground)
    }
    
    func testSCLAlertViewCircleView() {
        XCTAssertTrue(alert.circleView.isKind(of:UIView.self))
    }
    
    func testSCLAlertViewCircleIconView() {
        if let iconView = alert.circleIconView {
            XCTAssertTrue(iconView.isKind(of:UIView.self))
        }else {
            XCTAssertTrue(alert.circleIconView == nil)
        }
    }
    
    func testSCLAlertViewDurationTimer() {
        if let timer = alert.durationTimer {
            XCTAssertTrue(timer.isKind(of:Timer.self))
        }else {
            XCTAssertTrue(alert.durationTimer == nil)
        }
    }
}
