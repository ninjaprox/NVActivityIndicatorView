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
 *  This will add functionalities to UIViewController to display and remove UI blocker.
 */
public protocol NVActivityIndicatorViewable { }

public extension NVActivityIndicatorViewable where Self: UIViewController {

    /**
     Create a activity indicator view with specified frame, type, color and padding and start animation.
     
     - parameter size: activity indicator view's size. Default size is 60x60.
     - parameter message: message under activity indicator view.
     - parameter type: animation type, value of NVActivityIndicatorType enum. Default type is BallSpinFadeLoader.
     - parameter color: color of activity indicator view. Default color is white.
     - parameter padding: view's padding. Default padding is 0.
     - parameter minimumVisibleTime: minimum visible time of activity indicator view in UI blocker. Default value is 0 ms.
     - parameter displayTimeThreshold: minimum time that has to be elapsed in order to actually display the activity indicator view. Default is 0 ms.
     */
    public func startActivityAnimating(
        size: CGSize? = nil,
        message: String? = nil,
        type: NVActivityIndicatorType? = nil,
        color: UIColor? = nil,
        padding: CGFloat? = nil,
        minimumVisibleTime: Int = NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_VISIBLE_TIME,
        displayTimeThreshold: Int = NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD) {

        let data = ActivityData(
            size: size,
            message: message,
            type: type,
            color: color,
            padding: padding,
            minimumVisibleTime: minimumVisibleTime,
            displayTimeThreshold: displayTimeThreshold
        )

        NVActivityIndicatorPresenter.sharedInstance.startActivityAnimating(data)
    }

    /**
     Stop animation and remove from view hierarchy.
     */
    public func stopActivityAnimating() {
        NVActivityIndicatorPresenter.sharedInstance.stopActivityAnimating()
    }

}
