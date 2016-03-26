//
//  SCLButtonTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 22/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

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
        let type = alert.buttons[0].isKindOfClass(SCLButton.self)
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
        XCTAssertTrue(alert.contentView.subviews[2].isKindOfClass(SCLButton.self))
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
        let buttonTargets = alert.buttons[0].allTargets().first
        let button = alert.buttons[0]
        
        let actionsTouchUpInside = button.actionsForTarget(buttonTargets, forControlEvent: .TouchUpInside)
        XCTAssertTrue(actionsTouchUpInside![0] == "buttonTapped:")
        XCTAssertTrue(actionsTouchUpInside![1] == "buttonRelease:")

        let buttonActionsTouchDown = button.actionsForTarget(buttonTargets, forControlEvent: .TouchDown)
        XCTAssertTrue(buttonActionsTouchDown![0] == "buttonTapDown:")
        
        let buttonActionsTouchDragEnter = button.actionsForTarget(buttonTargets, forControlEvent: .TouchDragEnter)
        XCTAssertTrue(buttonActionsTouchDragEnter![0] == "buttonTapDown:")
        
        let buttonActionsTouchCancel = button.actionsForTarget(buttonTargets, forControlEvent: .TouchCancel)
        XCTAssertTrue(buttonActionsTouchCancel![0] == "buttonRelease:")
        
        let buttonActionsTouchDragOutside = button.actionsForTarget(buttonTargets, forControlEvent: .TouchDragOutside)
        XCTAssertTrue(buttonActionsTouchDragOutside![0] == "buttonRelease:")
        
        let buttonActionsTouchUpOutside = button.actionsForTarget(buttonTargets, forControlEvent: .TouchUpOutside)
        XCTAssertTrue(buttonActionsTouchUpOutside![0] == "buttonRelease:")
    }
    
    func testButtonSelectorAndTarget() {
        let alert = SCLAlertView()
        let testTarget = SCLAlertView()
        let testSelector = Selector()
        alert.addButton("testButtonTitle", target: testTarget, selector: testSelector)
        let button = alert.buttons[0]
        XCTAssertTrue(button.target.isKindOfClass(SCLAlertView.self))
        XCTAssertTrue(button.selector == testSelector)
        XCTAssertTrue(button.actionType == SCLActionType.Selector)
        
    }
    
    func testButtonActionType() {
        let alert = SCLAlertView()
        alert.addButton("testButtonTitle") {}
        let button = alert.buttons[0]
        XCTAssertTrue(button.actionType == SCLActionType.Closure)
    }
}
