//
//  NVActivityIndicatorViewable.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Basem Emara on 5/26/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

/**
 *  UIViewController conforms this protocol to be able to display NVActivityIndicatorView as UI blocker.
 *
 *  This extends abilities of UIViewController to display and remove UI blocker.
 */
public protocol NVActivityIndicatorViewable { }

public extension NVActivityIndicatorViewable where Self: UIViewController {
    
    /**
     Display UI blocker.
     
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter size:                 size of activity indicator view.
     - parameter message:              message displayed under activity indicator view.
     - parameter type:                 animation type.
     - parameter color:                color of activity indicator view.
     - parameter padding:              padding of activity indicator view.
     - parameter displayTimeThreshold: display time threshold to actually display UI blocker.
     - parameter minimumDisplayTime:   minimum display time of UI blocker.
     */
    public func startAnimating(
        size: CGSize? = nil,
        message: String? = nil,
        type: NVActivityIndicatorType? = nil,
        color: UIColor? = nil,
        padding: CGFloat? = nil,
        displayTimeThreshold: Int? = nil,
        minimumDisplayTime: Int? = nil) {
        let activityData = ActivityData(size: size,
                                        message: message,
                                        type: type,
                                        color: color,
                                        padding: padding,
                                        displayTimeThreshold: displayTimeThreshold,
                                        minimumDisplayTime: minimumDisplayTime)
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    /**
     Remove UI blocker.
     */
    public func stopAnimating() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    // MARK: Deprecated
    
    /**
     Display UI blocker.
     
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter size:    size of activity indicator view.
     - parameter message: message displayed under activity indicator view.
     - parameter type:    animation type.
     - parameter color:   color of activity indicator view.
     - parameter padding: padding of activity indicator view.
     */
    @available(*, deprecated=2.11, renamed="startAnimating()")
    public func startActivityAnimating(
        size: CGSize? = nil,
        message: String? = nil,
        type: NVActivityIndicatorType? = nil,
        color: UIColor? = nil,
        padding: CGFloat? = nil) {
        self.startAnimating(size,
                            message: message,
                            type: type,
                            color: color,
                            padding: padding)
    }
    
    /**
     Remove UI blocker.
     */
    @available(*, deprecated=2.11, renamed="stopAnimating()")
    public func stopActivityAnimating() {
        self.stopAnimating()
    }
    
}
