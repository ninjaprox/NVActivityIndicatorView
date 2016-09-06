//
//  NVActivityIndicatorPresenter.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Diego Ernst on 8/31/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

class ActivityData {

    let size: CGSize?
    let message: String?
    let type: NVActivityIndicatorType?
    let color: UIColor?
    let padding: CGFloat?
    let minimumVisibleTime: NSTimeInterval
    let displayTimeThreshold: NSTimeInterval

    init(size: CGSize?, message: String?, type: NVActivityIndicatorType?, color: UIColor?, padding: CGFloat?, minimumVisibleTime: NSTimeInterval, displayTimeThreshold: NSTimeInterval) {
        self.size = size
        self.message = message
        self.type = type
        self.color = color
        self.padding = padding
        self.minimumVisibleTime = minimumVisibleTime
        self.displayTimeThreshold = displayTimeThreshold
    }

}

class NVActivityIndicatorPresenter {

    static let sharedInstance = NVActivityIndicatorPresenter()

    private var showActivityTimer: NSTimer?
    private var hideActivityTimer: NSTimer?
    private var userWantsToStopActivity = false
    private let activityRestorationIdentifier = "NVActivityIndicatorViewContainer"

    private init() { }

    func startActivityAnimating(data: ActivityData) {
        guard showActivityTimer == nil else { return }
        userWantsToStopActivity = false
        showActivityTimer = scheduleTimer(data.displayTimeThreshold, selector: #selector(NVActivityIndicatorPresenter.showActivityTimerFired(_:)), data: data)
    }

    func stopActivityAnimating() {
        userWantsToStopActivity = true
        guard hideActivityTimer == nil else { return }
        hideActivity()
    }

    // MARK: - Timer events

    @objc func hideActivityTimerFired(timer: NSTimer) {
        hideActivityTimer?.invalidate()
        hideActivityTimer = nil
        if userWantsToStopActivity {
            hideActivity()
        }
    }

    @objc func showActivityTimerFired(timer: NSTimer) {
        guard let activityData = timer.userInfo as? ActivityData else { return }
        showActivity(activityData)
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

        hideActivityTimer = scheduleTimer(activityData.minimumVisibleTime, selector: #selector(NVActivityIndicatorPresenter.hideActivityTimerFired(_:)), data: nil)
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

    private func scheduleTimer(timeInterval: NSTimeInterval, selector: Selector, data: ActivityData?) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(timeInterval / 1000, target: self, selector: selector, userInfo: data, repeats: false)
    }

}
