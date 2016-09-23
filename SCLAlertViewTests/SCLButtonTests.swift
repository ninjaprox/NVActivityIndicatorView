//
//  SCLButtonTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 22/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import XCTest

class SCLButtonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testButtonClassType() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        let type = alert.buttons[0].isKind(of: SCLButton.self)
        XCTAssertTrue(type == true)
    }
    
    func testButtonProperties() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        let button = alert.buttons[0] 
        XCTAssertTrue(button.layer.masksToBounds == true)
        XCTAssertTrue(button.titleLabel?.text == "testButtonTitle")
        XCTAssertTrue(button.titleLabel?.font == UIFont(name:"HelveticaNeue-Bold", size: 14))
    }
    
    func testButtonAddedToAlert() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        XCTAssertTrue(alert.contentView.subviews.count == 3)
        XCTAssertTrue(alert.contentView.subviews[2].isKind(of: SCLButton.self))
    }
    
    func actionHelperForTests() -> Void {
        print("testingButtonActions")
    }
    
    func testActionAddedToButton() {
        let alert = SCLAlertView()
        alert.addButton("testButtontitle") {self.actionHelperForTests()}
        let button = alert.buttons[0]
        XCTAssertNotNil(button.action)
    }
    
    func testButtonTargets() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        let buttonTargets = alert.buttons[0].allTargets.first
        let button = alert.buttons[0]
        
        let actionsTouchUpInside = button.actions(forTarget: buttonTargets, forControlEvent: .touchUpInside)
        XCTAssertTrue(actionsTouchUpInside![0] == "buttonTapped:")
        XCTAssertTrue(actionsTouchUpInside![1] == "buttonRelease:")

        let buttonActionsTouchDown = button.actions(forTarget: buttonTargets, forControlEvent: .touchDown)
        XCTAssertTrue(buttonActionsTouchDown![0] == "buttonTapDown:")
        
        let buttonActionsTouchDragEnter = button.actions(forTarget: buttonTargets, forControlEvent: .touchDragEnter)
        XCTAssertTrue(buttonActionsTouchDragEnter![0] == "buttonTapDown:")
        
        let buttonActionsTouchCancel = button.actions(forTarget: buttonTargets, forControlEvent: .touchCancel)
        XCTAssertTrue(buttonActionsTouchCancel![0] == "buttonRelease:")
        
        let buttonActionsTouchDragOutside = button.actions(forTarget: buttonTargets, forControlEvent: .touchDragOutside)
        XCTAssertTrue(buttonActionsTouchDragOutside![0] == "buttonRelease:")
        
        let buttonActionsTouchUpOutside = button.actions(forTarget: buttonTargets, forControlEvent: .touchUpOutside)
        XCTAssertTrue(buttonActionsTouchUpOutside![0] == "buttonRelease:")
    }
    
    func testButtonSelectorAndTarget() {
        let alert = SCLAlertView()
        let testTarget = SCLAlertView()
        alert.addButton("testButtonTitle", target: testTarget, selector: #selector(testSelector))
        let button = alert.buttons[0]
        XCTAssertTrue(button.target.isKind(of: SCLAlertView.self))
        XCTAssertTrue(button.selector == #selector(testSelector))
        XCTAssertTrue(button.actionType == SCLActionType.selector)
        
    }
    
    func testSelector() {
        
    }
    
    func testButtonActionType() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        let button = alert.buttons[0]
        XCTAssertTrue(button.actionType == SCLActionType.closure)
    }
}
