//
//  ViewController.swift
//  SCLAlertViewExample
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
        
        SCLAlertView().showTitle(self, title: kSuccessTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Success)
    }
    
    @IBAction func showError(sender : AnyObject) {
        SCLAlertView().showTitle(self, title: kErrorTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Error)
    }
    
    @IBAction func showNotice(sender : AnyObject) {
        SCLAlertView().showTitle(self, title: kNoticeTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Notice)
    }
    
    @IBAction func showWarning(sender : AnyObject) {
        SCLAlertView().showTitle(self, title: kWarningTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Warning)
    }
    
    @IBAction func showInfo(sender : AnyObject) {
        SCLAlertView().showTitle(self, title: kInfoTitle, subTitle: kSubtitle, duration: kDefaultAnimationDuration, style: SCLAlertViewStyle.Info)
    }
}
