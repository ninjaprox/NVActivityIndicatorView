//
//  SCLAlertViewTests.swift
//  SCLAlertViewTests
//
//  Created by Alexey Poimtsev on 22/05/15.
//  Copyright (c) 2015 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import UIKit
import XCTest

class SCLAlertViewStyleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSCLAlertViewStyleColorSuccess() {
        let success = SCLAlertViewStyle.success
        XCTAssertTrue(success.defaultColorInt == 0x22B573)
    }
    
    func testSCLAlertViewStyleColorError() {
        let success = SCLAlertViewStyle.error
        XCTAssertTrue(success.defaultColorInt == 0xC1272D)
    }
    
    func testSCLAlertViewStyleColorNotice() {
        let success = SCLAlertViewStyle.notice
        XCTAssertTrue(success.defaultColorInt == 0x727375)
    }
    
    func testSCLAlertViewStyleColorWarning() {
        let success = SCLAlertViewStyle.warning
        XCTAssertTrue(success.defaultColorInt == 0xFFD110)
    }
    
    func testSCLAlertViewStyleColorInfo() {
        let success = SCLAlertViewStyle.info
        XCTAssertTrue(success.defaultColorInt == 0x2866BF)
    }
    
    func testSCLAlertViewStyleColorEdit() {
        let success = SCLAlertViewStyle.edit
        XCTAssertTrue(success.defaultColorInt == 0xA429FF)
    }
    
    func testSCLAlertViewStyleColorWait() {
        let success = SCLAlertViewStyle.wait
        XCTAssertTrue(success.defaultColorInt == 0xD62DA5)
    }
    
    func testSCLButtonTypeOnCreate() {
        let button = SCLButton()
        XCTAssertTrue(button.actionType == SCLActionType.none)
    }
 
}
