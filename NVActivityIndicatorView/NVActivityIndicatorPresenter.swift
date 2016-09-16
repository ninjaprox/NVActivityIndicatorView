//
//  NVActivityIndicatorPresenter.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Diego Ernst on 8/31/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

/// Class packages information used to display UI blocker.
public class ActivityData {
    /// Size of activity indicator view.
    let size: CGSize
    
    /// Message displayed under activity indicator view.
    let message: String?
    
    /// Animation type.
    let type: NVActivityIndicatorType
    
    /// Color of activity indicator view.
    let color: UIColor
    
    /// Padding of activity indicator view.
    let padding: CGFloat
    
    /// Display time threshold to actually display UI blocker.
    let displayTimeThreshold: Int
    
    /// Minimum display time of UI blocker.
    let minimumDisplayTime: Int
    
    /**
     Create information package used to display UI blocker.
     
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter size:                 size of activity indicator view.
     - parameter message:              message displayed under activity indicator view.
     - parameter type:                 animation type.
     - parameter color:                color of activity indicator view.
     - parameter padding:              padding of activity indicator view.
     - parameter displayTimeThreshold: display time threshold to actually display UI blocker.
     - parameter minimumDisplayTime:   minimum display time of UI blocker.
     
     - returns: The information package used to display UI blocker.
     */
    public init(size: CGSize? = nil,
                message: String? = nil,
                type: NVActivityIndicatorType? = nil,
                color: UIColor? = nil,
                padding: CGFloat? = nil,
                displayTimeThreshold: Int? = nil,
                minimumDisplayTime: Int? = nil) {
        self.size = size ?? NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE
        self.message = message
        self.type = type ?? NVActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? NVActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? NVActivityIndicatorView.DEFAULT_PADDING
        self.displayTimeThreshold = displayTimeThreshold ?? NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD
        self.minimumDisplayTime = minimumDisplayTime ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME
    }
}

/// Presenter that displays NVActivityIndicatorView as UI blocker.
public class NVActivityIndicatorPresenter {
    private var showActivityTimer: NSTimer?
    private var hideActivityTimer: NSTimer?
    private var userWantsToStopActivity = false
    private let activityRestorationIdentifier = "NVActivityIndicatorViewContainer"
    
    static let sharedInstance = NVActivityIndicatorPresenter()
    
    private init() { }
    
    // MARK: - Public interface
    
    /**
     Display UI blocker.
     
     - parameter data: Information package used to display UI blocker.
     */
    public func startAnimating(data: ActivityData) {
        guard showActivityTimer == nil else { return }
        userWantsToStopActivity = false
        showActivityTimer = scheduleTimer(data.displayTimeThreshold, selector: #selector(NVActivityIndicatorPresenter.showActivityTimerFired(_:)), data: data)
    }
    
    /**
     Remove UI blocker.
     */
    public func stopAnimating() {
        userWantsToStopActivity = true
        guard hideActivityTimer == nil else { return }
        hideActivity()
    }
    
    // MARK: - Timer events
    
    @objc private func showActivityTimerFired(timer: NSTimer) {
        guard let activityData = timer.userInfo as? ActivityData else { return }
        showActivity(activityData)
    }
    
    @objc private func hideActivityTimerFired(timer: NSTimer) {
        hideActivityTimer?.invalidate()
        hideActivityTimer = nil
        if userWantsToStopActivity {
            hideActivity()
        }
    }
    
    // MARK: - Helpers
    
    private func showActivity(activityData: ActivityData) {
        let activityContainer: UIView = UIView(frame: UIScreen.mainScreen().bounds)
        
        activityContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityContainer.restorationIdentifier = activityRestorationIdentifier
        
        let actualSize = activityData.size ?? NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE
        let activityIndicatorView = NVActivityIndicatorView(
            frame: CGRectMake(0, 0, actualSize.width, actualSize.height),
            type: activityData.type,
            color: activityData.color,
            padding: activityData.padding)
        
        activityIndicatorView.center = activityContainer.center
        activityIndicatorView.startAnimating()
        activityContainer.addSubview(activityIndicatorView)
        
        let width = activityContainer.frame.size.width / 3
        if let message = activityData.message where !message.isEmpty {
            let label = UILabel(frame: CGRectMake(0, 0, width, 30))
            label.center = CGPointMake(
                activityIndicatorView.center.x,
                activityIndicatorView.center.y + actualSize.height)
            label.textAlignment = .Center
            label.text = message
            label.font = UIFont.boldSystemFontOfSize(20)
            label.textColor = activityIndicatorView.color
            activityContainer.addSubview(label)
        }
        
        hideActivityTimer = scheduleTimer(activityData.minimumDisplayTime, selector: #selector(NVActivityIndicatorPresenter.hideActivityTimerFired(_:)), data: nil)
        UIApplication.sharedApplication().keyWindow!.addSubview(activityContainer)
    }
    
    private func hideActivity() {
        for item in UIApplication.sharedApplication().keyWindow!.subviews
            where item.restorationIdentifier == activityRestorationIdentifier {
                item.removeFromSuperview()
        }
        showActivityTimer?.invalidate()
        showActivityTimer = nil
    }
    
    private func scheduleTimer(timeInterval: Int, selector: Selector, data: ActivityData?) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(Double(timeInterval) / 1000,
                                                      target: self,
                                                      selector: selector,
                                                      userInfo: data,
                                                      repeats: false)
    }
}
