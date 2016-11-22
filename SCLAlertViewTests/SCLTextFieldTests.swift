//
//  SCLATextFieldTests.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 20/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import XCTest

class SCLTextFieldTests: XCTestCase {

    let alert = SCLAlertView()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTextFieldFormat() {
        let textfield = alert.addTextField("testTextField")
        XCTAssertTrue(textfield.isKind(of: UITextField.self))
        XCTAssertTrue(textfield.borderStyle == UITextBorderStyle.roundedRect)
        XCTAssertTrue(textfield.font == UIFont(name: "HelveticaNeue", size: 14))
        XCTAssertTrue(textfield.autocapitalizationType == UITextAutocapitalizationType.words)
        XCTAssertTrue(textfield.clearButtonMode == UITextFieldViewMode.whileEditing)
        XCTAssertTrue(textfield.layer.masksToBounds == true)
        XCTAssertTrue(textfield.layer.borderWidth == 1.0)
        XCTAssertTrue(textfield.placeholder == "testTextField")
    }
}
