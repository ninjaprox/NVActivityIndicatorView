//
//  ViewController.swift
//  SCPopUpView
//
//  Created by Viktor Radchenko on 6/6/14.
//  Copyright (c) 2014 Viktor Radchenko. All rights reserved.
//

import UIKit

let kSuccessTitle: NSString = "Congratulation"
let kErrorTitle: NSString = "Connection error"
let kNoticeTitle: NSString = "Notice"
let kWarningTitle: NSString = "Warning"
let kInfoTitle: NSString = "Info"
let kSubtitle: NSString = "You've just displayed this awesome Pop Up View"

let kDefaultAnimationDuration = 2.0

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSuccess(sender : AnyObject) {
        
        SCPopUpView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewSuccess)
    }

    @IBAction func showError(sender : AnyObject) {
        SCPopUpView().showTitle(self, title: kErrorTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewError)
    }
    
    @IBAction func showNotice(sender : AnyObject) {
        SCPopUpView().showTitle(self, title: kNoticeTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewNotice)
    }
    
    @IBAction func showWarning(sender : AnyObject) {
        SCPopUpView().showTitle(self, title: kWarningTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewWarning)
    }
    
    @IBAction func showInfo(sender : AnyObject) {
        SCPopUpView().showTitle(self, title: kInfoTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCPopUpViewStyle.SCPopUpViewInfo)
    }
}

