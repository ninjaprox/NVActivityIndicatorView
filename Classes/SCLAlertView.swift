//
//  SCLAlertView.swift
//  SCLAlertView Example
//
//  Created by Viktor Radchenko on 6/5/14.
//  Copyright (c) 2014 Viktor Radchenko. All rights reserved.
//

import Foundation
import UIKit

// Pop Up Styles
enum SCLAlertViewStyle {
    case Success, Error, Notice, Warning, Info
}

// Allow alerts to be closed/renamed in a chainable manner
// Example: SCLAlertView().showSuccess(self, title: "Test", subTitle: "Value").close()
class SCLAlertViewResponder {
    let alertview: SCLAlertView
    
    // Initialisation and Title/Subtitle/Close functions
    init(alertview: SCLAlertView) { self.alertview = alertview }
    func setTitle(title: String) { self.alertview.labelView.text = title }
    func setSubTitle(subTitle: String) { self.alertview.labelViewDescription.text = subTitle }
    func close() { self.alertview.doneButtonAction() }
}

// The Main Class
class SCLAlertView: UIView {
    let kDefaultShadowOpacity: CGFloat = 0.7
    let kCircleHeight: CGFloat = 56.0
    let kCircleTopPosition: CGFloat = -12.0 // Should not be defined here. Make it dynamic
    let kCircleBackgroundTopPosition: CGFloat = -15.0 // Should not be defined here. Make it dynamic
    let kCircleHeightBackground: CGFloat = 62.0
    let kCircleIconHeight: CGFloat = 20.0
    let kWindowWidth: CGFloat = 240.0
    let kWindowHeight: CGFloat = 228.0
    
    // Font
    let kDefaultFont: NSString = "HelveticaNeue"
    
    // Members declaration
    var labelView: UILabel
    var labelViewDescription: UILabel
    var shadowView: UIView
    var contentView: UIView
    var circleView: UIView
    var circleViewBackground: UIView
    var circleIconImageView: UIImageView
    var doneButton: UIButton
    var rootViewController: UIViewController
    var durationTimer: NSTimer!
    
    init () {
        // Content View
        self.contentView = UIView(frame: CGRect(x: 0, y: kCircleHeight / 4, width: kWindowWidth, height: kWindowHeight))
        self.contentView.backgroundColor = UIColor(white: 1, alpha: 1)
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 0.5
        
        // Circle View
        self.circleView = UIView(frame: CGRect(x: kWindowWidth / 2 - kCircleHeight / 2, y: kCircleTopPosition, width: kCircleHeight, height: kCircleHeight))
        self.circleView.layer.cornerRadius = self.circleView.frame.size.height / 2
        
        // Circle View Background
        
        self.circleViewBackground = UIView(frame: CGRect(x: kWindowWidth / 2 - kCircleHeightBackground / 2, y: kCircleBackgroundTopPosition, width: kCircleHeightBackground, height: kCircleHeightBackground))
        self.circleViewBackground.layer.cornerRadius = self.circleViewBackground.frame.size.height / 2
        self.circleViewBackground.backgroundColor = UIColor.whiteColor()
        
        // Circle View Image
        self.circleIconImageView = UIImageView(frame: CGRect(x: kCircleHeight / 2 - kCircleIconHeight / 2, y: kCircleHeight / 2 - kCircleIconHeight / 2, width: kCircleIconHeight, height: kCircleIconHeight))
        self.circleView.addSubview(self.circleIconImageView)
        
        // Title
        self.labelView = UILabel(frame: CGRect(x: 12, y: kCircleHeight / 2 + 22, width: kWindowWidth - 24, height: 40))
        self.labelView.numberOfLines = 1
        self.labelView.textAlignment = .Center
        self.labelView.font = UIFont(name: kDefaultFont, size: 20)
        self.contentView.addSubview(self.labelView)
        
        // Subtitle
        self.labelViewDescription = UILabel(frame: CGRect(x: 12, y: 84, width: kWindowWidth - 24, height: 80))
        self.labelViewDescription.numberOfLines = 3
        self.labelViewDescription.textAlignment = .Center
        self.labelViewDescription.font = UIFont(name: kDefaultFont, size: 14)
        self.contentView.addSubview(self.labelViewDescription)
        
        // Shadow View
        self.shadowView = UIView(frame: UIScreen.mainScreen().bounds)
        self.shadowView.backgroundColor = UIColor.blackColor()
        
        // Done Button
        self.doneButton = UIButton(frame: CGRect(x: 12, y: kWindowHeight - 52, width: kWindowWidth - 24, height: 40))
        self.doneButton.layer.cornerRadius = 3
        self.doneButton.layer.masksToBounds = true
        self.doneButton.setTitle("Done", forState: UIControlState.Normal)
        self.doneButton.titleLabel.font = UIFont(name: kDefaultFont, size: 14)
        self.contentView.addSubview(self.doneButton)
        
        // Root view controller
        self.rootViewController = UIViewController()
        
        // Superclass initiation
        super.init(frame: CGRect(x: (320 - kWindowWidth) / 2, y: 0 - kWindowHeight, width: kWindowWidth, height: kWindowHeight))
        
        // Show notice on screen
        self.addSubview(self.contentView)
        self.addSubview(self.circleViewBackground)
        self.addSubview(self.circleView)
        
        // Colours
        self.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF)
        self.labelView.textColor = UIColorFromRGB(0x4D4D4D)
        self.labelViewDescription.textColor = UIColorFromRGB(0x4D4D4D)
        self.contentView.layer.borderColor = UIColorFromRGB(0xCCCCCC).CGColor
        
        // On complete.
        self.doneButton.addTarget(self, action: Selector("doneButtonAction"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    // showTitle(view, title, subTitle, style)
    func showTitle(view: UIViewController, title: String, subTitle: String, style: SCLAlertViewStyle) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: style)
    }
    
    // showSuccess(view, title, subTitle)
    func showSuccess(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: SCLAlertViewStyle.Success)
    }
    
    // showError(view, title, subTitle)
    func showError(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: SCLAlertViewStyle.Error)
    }
    
    // showNotice(view, title, subTitle)
    func showNotice(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: SCLAlertViewStyle.Notice)
    }
    
    // showWarning(view, title, subTitle)
    func showWarning(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: SCLAlertViewStyle.Warning)
    }
    
    // showInfo(view, title, subTitle)
    func showInfo(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: SCLAlertViewStyle.Info)
    }
    
    // showTitle(view, title, subTitle, duration, style)
    func showTitle(view:UIViewController, title: String, subTitle: String, duration: NSTimeInterval?, completeText: String?, style: SCLAlertViewStyle) -> SCLAlertViewResponder {
        self.alpha = 0
        self.rootViewController = view
        self.rootViewController.view.addSubview(self.shadowView)
        self.rootViewController.view.addSubview(self)
        
        // Complete text
        if(completeText != nil) {
            self.doneButton.setTitle(completeText, forState: UIControlState.Normal)
        }
        
        // Alert colour/icon
        var viewColor: UIColor = UIColor()
        var iconImageName: NSString = ""
        
        // Icon style
        switch(style) {
        case .Success:
            viewColor = UIColorFromRGB(0x22B573)
            iconImageName = "notification-success"
            
        case .Error:
            viewColor = UIColorFromRGB(0xC1272D)
            iconImageName = "notification-error"
            
        case .Notice:
            viewColor = UIColorFromRGB(0x727375)
            iconImageName = "notification-notice"
            
        case .Warning:
            viewColor = UIColorFromRGB(0xFFD110)
            iconImageName = "notification-warning"
            
        case .Info:
            viewColor = UIColorFromRGB(0x2866BF)
            iconImageName = "notification-info"
            
        default:
            println("default")
        }
        
        // Title
        if ((title as NSString).length > 0) {
            self.labelView.text = title
        }
        
        // Subtitle
        if ((subTitle as NSString).length > 0) {
            self.labelViewDescription.text = subTitle
        }
        
        // Alert view colour and images
        self.doneButton.backgroundColor = viewColor
        self.circleView.backgroundColor = viewColor
        self.circleIconImageView.image = UIImage(named: iconImageName)
        
        // Adding duration
        if (duration != nil && duration > 0) {
            durationTimer?.invalidate()
            durationTimer = NSTimer.scheduledTimerWithTimeInterval(duration!, target: self, selector: Selector("hideView"), userInfo: nil, repeats: false)
        }
        
        // Animate in the alert view
        UIView.animateWithDuration(0.2, animations: {
            self.shadowView.alpha = self.kDefaultShadowOpacity
            self.frame.origin.y = self.rootViewController.view.center.y - 100
            self.alpha = 1
        }, completion: { finished in
            UIView.animateWithDuration(0.2, animations: {
                self.center = self.rootViewController.view.center
            }, completion: { finished in })
        })
        
        // Chainable objects
        return SCLAlertViewResponder(alertview: self)
    }
    
    // When click 'Done' button, hide view.
    func doneButtonAction() { hideView() }
    
    // Close SCLAlertView
    func hideView() {
        UIView.animateWithDuration(0.2, animations: {
            self.shadowView.alpha = 0
            self.alpha = 0
        }, completion: { finished in
            self.shadowView.removeFromSuperview()
            self.removeFromSuperview()
        })
    }
    
    // Helper function to convert from RGB to UIColor
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}