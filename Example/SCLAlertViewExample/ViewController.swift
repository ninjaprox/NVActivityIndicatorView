//
//  ViewController.swift
//  SCLAlertViewExample
//
//  Created by Viktor Radchenko on 6/6/14.
//  Copyright (c) 2014 Viktor Radchenko. All rights reserved.
//

import UIKit

let kSuccessTitle = "Congratulations"
let kErrorTitle = "Connection error"
let kNoticeTitle = "Notice"
let kWarningTitle = "Warning"
let kInfoTitle = "Info"
let kSubtitle = "You've just displayed this awesome Pop Up View"

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
    
    @IBAction func showSuccess(sender: AnyObject) {
        SCLAlertView().showSuccess(self, title: kSuccessTitle, subTitle: kSubtitle)
        // SCLAlertView().showSuccess(self, title: kSuccessTitle, subTitle: kSubtitle).close()
    }
    
    @IBAction func showError(sender: AnyObject) {
        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showNotice(sender: AnyObject) {
        SCLAlertView().showNotice(self, title: kNoticeTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showWarning(sender: AnyObject) {
        SCLAlertView().showWarning(self, title: kWarningTitle, subTitle: kSubtitle)
    }
    
    @IBAction func showInfo(sender: AnyObject) {
        SCLAlertView().showInfo(self, title: kInfoTitle, subTitle: kSubtitle)
    }
}
