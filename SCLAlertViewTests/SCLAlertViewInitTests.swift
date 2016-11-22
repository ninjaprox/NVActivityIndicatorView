//
//  SCLAlertViewInitTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 20/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import XCTest

class SCLAlertViewInitTests: XCTestCase {

    let alert = SCLAlertView()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewFrame() {
        XCTAssertTrue(alert.view.frame == UIScreen.main.bounds)
    }
    
    func testViewResizingMask() {
        XCTAssertTrue(alert.view.autoresizingMask == [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth])
    }
    
    func testViewBackgroundColor() {
        XCTAssertTrue(alert.view.backgroundColor == UIColor(red:0, green:0, blue:0, alpha:0.7))
    }
    
    func testViewSubViews() {
        XCTAssertTrue(alert.view.subviews.count == 1)
        let subview = alert.view.subviews[0]
        XCTAssertTrue(subview.isKind(of: UIView.self))
    }

    func testContentViewCornerRadius() {
        XCTAssertTrue(alert.contentView.layer.cornerRadius == 5.0)
    }
    
    func testContentViewMaskToBounds() {
        XCTAssertTrue(alert.contentView.layer.masksToBounds == true)
    }
    
    func testContentViewBorderWidth() {
        XCTAssertTrue(alert.contentView.layer.borderWidth == 0.5)
    }
    
    func testContentViewLabeltitle() {
        XCTAssertTrue(alert.contentView.subviews.count == 2)
        let subview1 = alert.contentView.subviews[0]
        XCTAssertTrue(subview1.isKind(of: UILabel.self))
        let subview2 = alert.contentView.subviews[1]
        XCTAssertTrue(subview2.isKind(of: UITextView.self))
        alert.addButton("testButtonTitle") {}
        let subview3 = alert.contentView.subviews[2]
        XCTAssertTrue(subview3.isKind(of: SCLButton.self))
    }
}
