//
//  SCPopUpView.swift
//
//  Created by Viktor Radchenko on 6/5/14.
//  Copyright (c) 2014 Viktor Radchenko. All rights reserved.
//

import Foundation
import UIKit

// Pop Up Styles
enum SCPopUpViewStyle: Int {
    case SCPopUpViewSuccess
    case SCPopUpViewError
    case SCPopUpViewNotice
    case SCPopUpViewWarning
    case SCPopUpViewInfo
}

class SCPopUpView : UIView {
    
    let kDefaultShadowOpacity: CGFloat = 0.7
    let kCircleHeight: CGFloat = 56.0
    let kCircleHeightBackground: CGFloat = 62.0
    let kCirclePadding: CGFloat = 6
    let kCicrleIconHeight: CGFloat = 20.0
    let kWindowWidth: CGFloat = 240.0
    let kWindowHeight: CGFloat = 228.0
    
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
        self.contentView = UIView(frame: CGRectMake(0, kCircleHeight / 4, kWindowWidth, kWindowHeight))
        self.contentView.backgroundColor = UIColor(white: 1, alpha: 1);
        self.contentView.layer.cornerRadius = 5;
        self.contentView.layer.masksToBounds = true;
        self.contentView.layer.borderWidth = 0.5;
        
        // Circle View
        self.circleView = UIView(frame: CGRectMake(kCirclePadding / 2, kCirclePadding / 2, kCircleHeight, kCircleHeight))
        self.circleView.layer.cornerRadius =  self.circleView.frame.size.height / 2;
        
        self.circleViewBackground = UIView(frame: CGRectMake(kWindowWidth / 2 - kCircleHeightBackground / 2, kCircleHeightBackground / 2 - kCircleHeightBackground + 14, kCircleHeightBackground, kCircleHeightBackground))
        self.circleViewBackground.backgroundColor = UIColor.whiteColor()
        circleViewBackground.layer.cornerRadius =  circleViewBackground.frame.size.height / 2;
        
        // Circle View Image
        self.circleIconImageView = UIImageView(frame: CGRectMake(kCircleHeight / 2 - kCicrleIconHeight / 2, kCircleHeight / 2 - kCicrleIconHeight / 2, kCicrleIconHeight, kCicrleIconHeight))
        self.circleView.addSubview(self.circleIconImageView)
        
        // Label View
        self.labelView = UILabel(frame: CGRectMake(12, kCircleHeight / 2 + 20, kWindowWidth - 24, 40))
        self.labelView.numberOfLines = 1
        self.labelView.textAlignment = NSTextAlignment.Center
        self.labelView.font = UIFont(name: kDefaultFont, size: 20)
        self.contentView.addSubview(self.labelView)
        
        // LabelView Description
        self.labelViewDescription = UILabel(frame: CGRectMake(12, 84, kWindowWidth - 24, 80))
        self.labelViewDescription.numberOfLines = 3
        self.labelViewDescription.textAlignment = NSTextAlignment.Center
        self.labelViewDescription.font = UIFont(name: kDefaultFont, size: 14)
        self.contentView.addSubview(self.labelViewDescription)
        
        // Shadow View
        self.shadowView = UIView(frame: UIScreen.mainScreen().bounds)
        self.shadowView.backgroundColor = UIColor.blackColor()
        
        // Done Button
        self.doneButton = UIButton(frame: CGRectMake(12, kWindowHeight - 52, kWindowWidth - 24, 40))
        self.doneButton.layer.cornerRadius = 3
        self.doneButton.layer.masksToBounds = true
        self.doneButton.setTitle("Done", forState: UIControlState.Normal)
        self.doneButton.titleLabel.font = UIFont(name: kDefaultFont, size: 14)
        self.contentView.addSubview(self.doneButton)
        
        self.rootViewController = UIViewController()
        
        super.init(frame: CGRectMake(((320 - kWindowWidth) / 2), 0 - kWindowHeight, kWindowWidth , kWindowHeight))
        
        self.addSubview(self.contentView)
        self.addSubview(self.circleViewBackground)
        self.circleViewBackground.addSubview(self.circleView)
        
        
        self.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF)
        self.labelView.textColor = UIColorFromRGB(0x4D4D4D)
        self.labelViewDescription.textColor = UIColorFromRGB(0x4D4D4D)
        self.contentView.layer.borderColor = UIColorFromRGB(0xCCCCCC).CGColor
        
        self.doneButton.addTarget(self, action: Selector("doneButtonAction"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func showTitle(view:UIViewController,  title: String, subTitle: String, duration: NSTimeInterval, style: SCPopUpViewStyle) {
        
        self.alpha = 0;
        self.rootViewController = view
        self.rootViewController.view.addSubview(self.shadowView)
        self.rootViewController.view.addSubview(self)
        
        var viewColor: UIColor = UIColor()
        var iconImageName: NSString?
        
        switch(style) {
            case SCPopUpViewStyle.SCPopUpViewSuccess:
                viewColor = UIColorFromRGB(0x22B573);
                iconImageName = "notification-success"
            
            case SCPopUpViewStyle.SCPopUpViewError:
                viewColor = UIColorFromRGB(0xC1272D);
                iconImageName = "notification-error"
            
            case SCPopUpViewStyle.SCPopUpViewNotice:
            
                viewColor = UIColorFromRGB(0x727375)
                iconImageName = "notification-notice"
            
            case SCPopUpViewStyle.SCPopUpViewWarning:
            
                viewColor = UIColorFromRGB(0xFFD110);
                iconImageName = "notification-warning"
            
            case SCPopUpViewStyle.SCPopUpViewInfo:
            
                viewColor = UIColorFromRGB(0x2866BF);
                iconImageName = "notification-info"
            
            default:
                println("default")
        }
        
        // LabelView
        if ((title as NSString).length > 0 ) {
            self.labelView.text = title;
        }
        
        if ((subTitle as NSString).length > 0) {
            self.labelViewDescription.text = subTitle;
        }
        
        self.doneButton.backgroundColor = viewColor;
        self.circleView.backgroundColor = viewColor;
        self.circleIconImageView.image = UIImage(named: iconImageName)
        
        // Adding duration
        if (duration > 0) {
            durationTimer?.invalidate()
            durationTimer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: Selector("hideView"), userInfo: nil, repeats: false)
        }
        
        UIView.animateWithDuration(0.2, animations: {
            
            self.shadowView.alpha = self.kDefaultShadowOpacity
            
            var frame:CGRect = self.frame;
            frame.origin.y = self.rootViewController.view.center.y - 100;
            self.frame = frame;
            
            self.alpha = 1;
            
            }, completion: { finished in
                
                UIView.animateWithDuration(0.2, animations: {
                    self.center = self.rootViewController.view.center;
                }, completion: { finished in
                        
                })
        })
    }
    
    func doneButtonAction() {
        hideView()
    }
    
    func hideView() {
        
        UIView.animateWithDuration(0.2, animations: {
            self.shadowView.alpha = 0;
            self.alpha = 0;
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