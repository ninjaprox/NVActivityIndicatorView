//
//  SCLPublicConstructorsTest.swift
//  SCLAlertView
//
//  Created by Christian Cabarrocas on 26/03/16.
//  Copyright © 2016 Alexey Poimtsev. All rights reserved.
//

@testable import SCLAlertView

import XCTest

class SCLPublicConstructorsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowSuccess() {
        let image = UIImage()
        let alert = SCLAlertView()
        let successReturn = alert.showSuccess("testTitle", subTitle: "testSubTitle", closeButtonTitle: "testClosebutton", duration: 1.0, colorStyle: 1, colorTextButton: 1, circleIconImage: image)
        XCTAssertNotNil(successReturn)
    }

}



/*
public func showSuccess(title: String, subTitle: String, closeButtonTitle:String?=nil, duration:NSTimeInterval=0.0, colorStyle: UInt=SCLAlertViewStyle.Success.defaultColorInt, colorTextButton: UInt=0xFFFFFF, circleIconImage: UIImage? = nil) -> SCLAlertViewResponder {
return showTitle(title, subTitle: subTitle, duration: duration, completeText:closeButtonTitle, style: .Success, colorStyle: colorStyle, colorTextButton: colorTextButton, circleIconImage: circleIconImage)
}

public class SCLAlertViewResponder {
let alertview: SCLAlertView

// Initialisation and Title/Subtitle/Close functions
public init(alertview: SCLAlertView) {
self.alertview = alertview
}

public func setTitle(title: String) {
self.alertview.labelTitle.text = title
}

public func setSubTitle(subTitle: String) {
self.alertview.viewText.text = subTitle
}

public func close() {
self.alertview.hideView()
}

public func setDismissBlock(dismissBlock: DismissBlock) {
self.alertview.dismissBlock = dismissBlock
}
*/