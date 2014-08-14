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
    let kDefaultFont = "HelveticaNeue"
    
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
    
    required init(coder aDecoder: NSCoder!) {
        fatalError("NSCoding not supported")
    }
    
    required override init () {
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
        self.doneButton.setTitle("Done", forState: .Normal)
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
        self.doneButton.addTarget(self, action: Selector("doneButtonAction"), forControlEvents: .TouchUpInside)
    }
    
    // showTitle(view, title, subTitle, style)
    func showTitle(view: UIViewController, title: String, subTitle: String, style: SCLAlertViewStyle) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: style)
    }
    
    // showSuccess(view, title, subTitle)
    func showSuccess(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: .Success)
    }
    
    // showError(view, title, subTitle)
    func showError(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: .Error)
    }
    
    // showNotice(view, title, subTitle)
    func showNotice(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: .Notice)
    }
    
    // showWarning(view, title, subTitle)
    func showWarning(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: .Warning)
    }
    
    // showInfo(view, title, subTitle)
    func showInfo(view: UIViewController, title: String, subTitle: String) -> SCLAlertViewResponder {
        return showTitle(view, title: title, subTitle: subTitle, duration: 2.0, completeText: nil, style: .Info)
    }
    
    // showTitle(view, title, subTitle, duration, style)
    func showTitle(view:UIViewController, title: String, subTitle: String, duration: NSTimeInterval?, completeText: String?, style: SCLAlertViewStyle) -> SCLAlertViewResponder {
        self.alpha = 0
        self.rootViewController = view
        self.rootViewController.view.addSubview(self.shadowView)
        self.rootViewController.view.addSubview(self)
        
        // Complete text
        if completeText != nil {
            self.doneButton.setTitle(completeText!, forState: .Normal)
        }
        
        // Alert colour/icon
        var viewColor = UIColor()
        var iconImage: UIImage
        
        // Icon style
        switch style {
        case .Success:
            viewColor = UIColorFromRGB(0x22B573)
            iconImage = SCLAlertViewStyleKit.imageOfCheckmark
            
        case .Error:
            viewColor = UIColorFromRGB(0xC1272D)
            iconImage = SCLAlertViewStyleKit.imageOfCross
            
        case .Notice:
            viewColor = UIColorFromRGB(0x727375)
            iconImage = SCLAlertViewStyleKit.imageOfNotice
            
        case .Warning:
            viewColor = UIColorFromRGB(0xFFD110)
            iconImage = SCLAlertViewStyleKit.imageOfWarning
            
        case .Info:
            viewColor = UIColorFromRGB(0x2866BF)
            iconImage = SCLAlertViewStyleKit.imageOfInfo
            
        }
        
        // Title
        if !title.isEmpty {
            self.labelView.text = title
        }
        
        // Subtitle
        if !subTitle.isEmpty {
            self.labelViewDescription.text = subTitle
        }
        
        // Alert view colour and images
        self.doneButton.backgroundColor = viewColor
        self.circleView.backgroundColor = viewColor
        self.circleIconImageView.image  = iconImage
        
        // Adding duration
        if duration > 0 {
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
            })
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

// ------------------------------------
// Icon drawing
// Code generated by PaintCode
// ------------------------------------

class SCLAlertViewStyleKit : NSObject {
    
    //// Cache
    
    struct Cache {
        static var imageOfCheckmark: UIImage?
        static var checkmarkTargets: [AnyObject]?
        static var imageOfCross: UIImage?
        static var crossTargets: [AnyObject]?
        static var imageOfNotice: UIImage?
        static var noticeTargets: [AnyObject]?
        static var imageOfWarning: UIImage?
        static var warningTargets: [AnyObject]?
        static var imageOfInfo: UIImage?
        static var infoTargets: [AnyObject]?
    }
    
    //// Initialization
    
    override class func load() {
    }
    
    //// Drawing Methods
    
    class func drawCheckmark() {
        
        //// Checkmark Shape Drawing
        var checkmarkShapePath = UIBezierPath()
        checkmarkShapePath.moveToPoint(CGPointMake(73.25, 14.05))
        checkmarkShapePath.addCurveToPoint(CGPointMake(64.51, 13.86), controlPoint1: CGPointMake(70.98, 11.44), controlPoint2: CGPointMake(66.78, 11.26))
        checkmarkShapePath.addLineToPoint(CGPointMake(27.46, 52))
        checkmarkShapePath.addLineToPoint(CGPointMake(15.75, 39.54))
        checkmarkShapePath.addCurveToPoint(CGPointMake(6.84, 39.54), controlPoint1: CGPointMake(13.48, 36.93), controlPoint2: CGPointMake(9.28, 36.93))
        checkmarkShapePath.addCurveToPoint(CGPointMake(6.84, 49.02), controlPoint1: CGPointMake(4.39, 42.14), controlPoint2: CGPointMake(4.39, 46.42))
        checkmarkShapePath.addLineToPoint(CGPointMake(22.91, 66.14))
        checkmarkShapePath.addCurveToPoint(CGPointMake(27.28, 68), controlPoint1: CGPointMake(24.14, 67.44), controlPoint2: CGPointMake(25.71, 68))
        checkmarkShapePath.addCurveToPoint(CGPointMake(31.65, 66.14), controlPoint1: CGPointMake(28.86, 68), controlPoint2: CGPointMake(30.43, 67.26))
        checkmarkShapePath.addLineToPoint(CGPointMake(73.08, 23.35))
        checkmarkShapePath.addCurveToPoint(CGPointMake(73.25, 14.05), controlPoint1: CGPointMake(75.52, 20.75), controlPoint2: CGPointMake(75.7, 16.65))
        checkmarkShapePath.closePath()
        checkmarkShapePath.miterLimit = 4;
        
        UIColor.whiteColor().setFill()
        checkmarkShapePath.fill()
    }
    
    class func drawCross() {
        
        //// Cross Shape Drawing
        var crossShapePath = UIBezierPath()
        crossShapePath.moveToPoint(CGPointMake(10, 70))
        crossShapePath.addLineToPoint(CGPointMake(70, 10))
        crossShapePath.moveToPoint(CGPointMake(10, 10))
        crossShapePath.addLineToPoint(CGPointMake(70, 70))
        crossShapePath.lineCapStyle = kCGLineCapRound;
        
        crossShapePath.lineJoinStyle = kCGLineJoinRound;
        
        UIColor.whiteColor().setStroke()
        crossShapePath.lineWidth = 14
        crossShapePath.stroke()
    }
    
    class func drawNotice() {
        
        //// Notice Shape Drawing
        var noticeShapePath = UIBezierPath()
        noticeShapePath.moveToPoint(CGPointMake(72, 48.54))
        noticeShapePath.addLineToPoint(CGPointMake(72, 39.9))
        noticeShapePath.addCurveToPoint(CGPointMake(66.38, 34.01), controlPoint1: CGPointMake(72, 36.76), controlPoint2: CGPointMake(69.48, 34.01))
        noticeShapePath.addCurveToPoint(CGPointMake(61.53, 35.97), controlPoint1: CGPointMake(64.82, 34.01), controlPoint2: CGPointMake(62.69, 34.8))
        noticeShapePath.addCurveToPoint(CGPointMake(60.36, 35.78), controlPoint1: CGPointMake(61.33, 35.97), controlPoint2: CGPointMake(62.3, 35.78))
        noticeShapePath.addLineToPoint(CGPointMake(60.36, 33.22))
        noticeShapePath.addCurveToPoint(CGPointMake(54.16, 26.16), controlPoint1: CGPointMake(60.36, 29.3), controlPoint2: CGPointMake(57.65, 26.16))
        noticeShapePath.addCurveToPoint(CGPointMake(48.73, 29.89), controlPoint1: CGPointMake(51.64, 26.16), controlPoint2: CGPointMake(50.67, 27.73))
        noticeShapePath.addLineToPoint(CGPointMake(48.73, 28.71))
        noticeShapePath.addCurveToPoint(CGPointMake(43.49, 21.64), controlPoint1: CGPointMake(48.73, 24.78), controlPoint2: CGPointMake(46.98, 21.64))
        noticeShapePath.addCurveToPoint(CGPointMake(39.03, 25.37), controlPoint1: CGPointMake(40.97, 21.64), controlPoint2: CGPointMake(39.03, 23.01))
        noticeShapePath.addLineToPoint(CGPointMake(39.03, 9.07))
        noticeShapePath.addCurveToPoint(CGPointMake(32.24, 2), controlPoint1: CGPointMake(39.03, 5.14), controlPoint2: CGPointMake(35.73, 2))
        noticeShapePath.addCurveToPoint(CGPointMake(25.45, 9.07), controlPoint1: CGPointMake(28.56, 2), controlPoint2: CGPointMake(25.45, 5.14))
        noticeShapePath.addLineToPoint(CGPointMake(25.45, 41.47))
        noticeShapePath.addCurveToPoint(CGPointMake(24.29, 43.44), controlPoint1: CGPointMake(25.45, 42.45), controlPoint2: CGPointMake(24.68, 43.04))
        noticeShapePath.addCurveToPoint(CGPointMake(9.55, 43.04), controlPoint1: CGPointMake(16.73, 40.88), controlPoint2: CGPointMake(11.88, 40.69))
        noticeShapePath.addCurveToPoint(CGPointMake(8, 46.58), controlPoint1: CGPointMake(8.58, 43.83), controlPoint2: CGPointMake(8, 45.2))
        noticeShapePath.addCurveToPoint(CGPointMake(14.4, 55.81), controlPoint1: CGPointMake(8.19, 50.31), controlPoint2: CGPointMake(12.07, 53.84))
        noticeShapePath.addLineToPoint(CGPointMake(27.2, 69.56))
        noticeShapePath.addCurveToPoint(CGPointMake(42.91, 77.8), controlPoint1: CGPointMake(30.5, 74.47), controlPoint2: CGPointMake(35.73, 77.21))
        noticeShapePath.addCurveToPoint(CGPointMake(43.88, 77.8), controlPoint1: CGPointMake(43.3, 77.8), controlPoint2: CGPointMake(43.68, 77.8))
        noticeShapePath.addCurveToPoint(CGPointMake(47.18, 78), controlPoint1: CGPointMake(45.04, 77.8), controlPoint2: CGPointMake(46.01, 78))
        noticeShapePath.addLineToPoint(CGPointMake(48.34, 78))
        noticeShapePath.addLineToPoint(CGPointMake(48.34, 78))
        noticeShapePath.addCurveToPoint(CGPointMake(71.61, 52.08), controlPoint1: CGPointMake(56.48, 78), controlPoint2: CGPointMake(69.87, 75.05))
        noticeShapePath.addCurveToPoint(CGPointMake(72, 48.54), controlPoint1: CGPointMake(71.81, 51.29), controlPoint2: CGPointMake(72, 49.72))
        noticeShapePath.closePath()
        noticeShapePath.miterLimit = 4;
        
        UIColor.whiteColor().setFill()
        noticeShapePath.fill()
    }
    
    class func drawWarning() {
        //// Color Declarations
        let greyColor = UIColor(red: 0.236, green: 0.236, blue: 0.236, alpha: 1.000)
        
        //// Warning Group
        //// Warning Circle Drawing
        var warningCirclePath = UIBezierPath()
        warningCirclePath.moveToPoint(CGPointMake(40.94, 63.39))
        warningCirclePath.addCurveToPoint(CGPointMake(36.03, 65.55), controlPoint1: CGPointMake(39.06, 63.39), controlPoint2: CGPointMake(37.36, 64.18))
        warningCirclePath.addCurveToPoint(CGPointMake(34.14, 70.45), controlPoint1: CGPointMake(34.9, 66.92), controlPoint2: CGPointMake(34.14, 68.49))
        warningCirclePath.addCurveToPoint(CGPointMake(36.22, 75.54), controlPoint1: CGPointMake(34.14, 72.41), controlPoint2: CGPointMake(34.9, 74.17))
        warningCirclePath.addCurveToPoint(CGPointMake(40.94, 77.5), controlPoint1: CGPointMake(37.54, 76.91), controlPoint2: CGPointMake(39.06, 77.5))
        warningCirclePath.addCurveToPoint(CGPointMake(45.86, 75.35), controlPoint1: CGPointMake(42.83, 77.5), controlPoint2: CGPointMake(44.53, 76.72))
        warningCirclePath.addCurveToPoint(CGPointMake(47.93, 70.45), controlPoint1: CGPointMake(47.18, 74.17), controlPoint2: CGPointMake(47.93, 72.41))
        warningCirclePath.addCurveToPoint(CGPointMake(45.86, 65.35), controlPoint1: CGPointMake(47.93, 68.49), controlPoint2: CGPointMake(47.18, 66.72))
        warningCirclePath.addCurveToPoint(CGPointMake(40.94, 63.39), controlPoint1: CGPointMake(44.53, 64.18), controlPoint2: CGPointMake(42.83, 63.39))
        warningCirclePath.closePath()
        warningCirclePath.miterLimit = 4;
        
        greyColor.setFill()
        warningCirclePath.fill()
        
        
        //// Warning Shape Drawing
        var warningShapePath = UIBezierPath()
        warningShapePath.moveToPoint(CGPointMake(46.23, 4.26))
        warningShapePath.addCurveToPoint(CGPointMake(40.94, 2.5), controlPoint1: CGPointMake(44.91, 3.09), controlPoint2: CGPointMake(43.02, 2.5))
        warningShapePath.addCurveToPoint(CGPointMake(34.71, 4.26), controlPoint1: CGPointMake(38.68, 2.5), controlPoint2: CGPointMake(36.03, 3.09))
        warningShapePath.addCurveToPoint(CGPointMake(31.5, 8.77), controlPoint1: CGPointMake(33.01, 5.44), controlPoint2: CGPointMake(31.5, 7.01))
        warningShapePath.addLineToPoint(CGPointMake(31.5, 19.36))
        warningShapePath.addLineToPoint(CGPointMake(34.71, 54.44))
        warningShapePath.addCurveToPoint(CGPointMake(40.38, 58.16), controlPoint1: CGPointMake(34.9, 56.2), controlPoint2: CGPointMake(36.41, 58.16))
        warningShapePath.addCurveToPoint(CGPointMake(45.67, 54.44), controlPoint1: CGPointMake(44.34, 58.16), controlPoint2: CGPointMake(45.67, 56.01))
        warningShapePath.addLineToPoint(CGPointMake(48.5, 19.36))
        warningShapePath.addLineToPoint(CGPointMake(48.5, 8.77))
        warningShapePath.addCurveToPoint(CGPointMake(46.23, 4.26), controlPoint1: CGPointMake(48.5, 7.01), controlPoint2: CGPointMake(47.74, 5.44))
        warningShapePath.closePath()
        warningShapePath.miterLimit = 4;
        
        greyColor.setFill()
        warningShapePath.fill()
    }
    
    class func drawInfo() {
        //// Color Declarations
        let color0 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        //// Info Shape Drawing
        var infoShapePath = UIBezierPath()
        infoShapePath.moveToPoint(CGPointMake(45.66, 15.96))
        infoShapePath.addCurveToPoint(CGPointMake(45.66, 5.22), controlPoint1: CGPointMake(48.78, 12.99), controlPoint2: CGPointMake(48.78, 8.19))
        infoShapePath.addCurveToPoint(CGPointMake(34.34, 5.22), controlPoint1: CGPointMake(42.53, 2.26), controlPoint2: CGPointMake(37.47, 2.26))
        infoShapePath.addCurveToPoint(CGPointMake(34.34, 15.96), controlPoint1: CGPointMake(31.22, 8.19), controlPoint2: CGPointMake(31.22, 12.99))
        infoShapePath.addCurveToPoint(CGPointMake(45.66, 15.96), controlPoint1: CGPointMake(37.47, 18.92), controlPoint2: CGPointMake(42.53, 18.92))
        infoShapePath.closePath()
        infoShapePath.moveToPoint(CGPointMake(48, 69.41))
        infoShapePath.addCurveToPoint(CGPointMake(40, 77), controlPoint1: CGPointMake(48, 73.58), controlPoint2: CGPointMake(44.4, 77))
        infoShapePath.addLineToPoint(CGPointMake(40, 77))
        infoShapePath.addCurveToPoint(CGPointMake(32, 69.41), controlPoint1: CGPointMake(35.6, 77), controlPoint2: CGPointMake(32, 73.58))
        infoShapePath.addLineToPoint(CGPointMake(32, 35.26))
        infoShapePath.addCurveToPoint(CGPointMake(40, 27.67), controlPoint1: CGPointMake(32, 31.08), controlPoint2: CGPointMake(35.6, 27.67))
        infoShapePath.addLineToPoint(CGPointMake(40, 27.67))
        infoShapePath.addCurveToPoint(CGPointMake(48, 35.26), controlPoint1: CGPointMake(44.4, 27.67), controlPoint2: CGPointMake(48, 31.08))
        infoShapePath.addLineToPoint(CGPointMake(48, 69.41))
        infoShapePath.closePath()
        color0.setFill()
        infoShapePath.fill()
    }
    
    //// Generated Images
    
    class var imageOfCheckmark: UIImage {
    if (Cache.imageOfCheckmark) {
        return Cache.imageOfCheckmark!
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), false, 0)
        SCLAlertViewStyleKit.drawCheckmark()
        Cache.imageOfCheckmark = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return Cache.imageOfCheckmark!
    }
    
    class var imageOfCross: UIImage {
    if (Cache.imageOfCross) {
        return Cache.imageOfCross!
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), false, 0)
        SCLAlertViewStyleKit.drawCross()
        Cache.imageOfCross = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return Cache.imageOfCross!
    }
    
    class var imageOfNotice: UIImage {
    if (Cache.imageOfNotice) {
        return Cache.imageOfNotice!
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), false, 0)
        SCLAlertViewStyleKit.drawNotice()
        Cache.imageOfNotice = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return Cache.imageOfNotice!
    }
    
    class var imageOfWarning: UIImage {
    if (Cache.imageOfWarning) {
        return Cache.imageOfWarning!
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), false, 0)
        SCLAlertViewStyleKit.drawWarning()
        Cache.imageOfWarning = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return Cache.imageOfWarning!
    }
    
    class var imageOfInfo: UIImage {
    if (Cache.imageOfInfo) {
        return Cache.imageOfInfo!
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), false, 0)
        SCLAlertViewStyleKit.drawInfo()
        Cache.imageOfInfo = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return Cache.imageOfInfo!
    }
}
