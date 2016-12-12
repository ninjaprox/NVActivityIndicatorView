//
//  NVActivityIndicatorPresenter.swift
//  NVActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

/// Class packages information used to display UI blocker.
public final class ActivityData {
    /// Size of activity indicator view.
    let size: CGSize
    
    /// Message displayed under activity indicator view.
    let message: String?
    
    /// Font of message displayed under activity indicator view.
    let messageFont: UIFont
    
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
     - parameter messageFont:          font of message displayed under activity indicator view.
     - parameter type:                 animation type.
     - parameter color:                color of activity indicator view.
     - parameter padding:              padding of activity indicator view.
     - parameter displayTimeThreshold: display time threshold to actually display UI blocker.
     - parameter minimumDisplayTime:   minimum display time of UI blocker.
     
     - returns: The information package used to display UI blocker.
     */
    public init(size: CGSize? = nil,
                message: String? = nil,
                messageFont: UIFont? = nil,
                type: NVActivityIndicatorType? = nil,
                color: UIColor? = nil,
                padding: CGFloat? = nil,
                displayTimeThreshold: Int? = nil,
                minimumDisplayTime: Int? = nil) {
        self.size = size ?? NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE
        self.message = message ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE
        self.messageFont = messageFont ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT
        self.type = type ?? NVActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? NVActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? NVActivityIndicatorView.DEFAULT_PADDING
        self.displayTimeThreshold = displayTimeThreshold ?? NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD
        self.minimumDisplayTime = minimumDisplayTime ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME
    }
}

/// Presenter that displays NVActivityIndicatorView as UI blocker.
public final class NVActivityIndicatorPresenter {
    private var showTimer: Timer?
    private var hideTimer: Timer?
    private var isStopAnimatingCalled = false
    private let restorationIdentifier = "NVActivityIndicatorViewContainer"
    
    
    /// Shared instance of `NVActivityIndicatorPresenter`.
    public static let sharedInstance = NVActivityIndicatorPresenter()
    
    private init() { }
    
    // MARK: - Public interface
    
    /**
     Display UI blocker.
     
     - parameter data: Information package used to display UI blocker.
     */
    public final func startAnimating(_ data: ActivityData) {
        guard showTimer == nil else { return }
        isStopAnimatingCalled = false
        showTimer = scheduledTimer(data.displayTimeThreshold, selector: #selector(showTimerFired(_:)), data: data)
    }
    
    /**
     Remove UI blocker.
     */
    public final func stopAnimating() {
        isStopAnimatingCalled = true
        guard hideTimer == nil else { return }
        hide()
    }
    
    // MARK: - Timer events
    
    @objc private func showTimerFired(_ timer: Timer) {
        guard let activityData = timer.userInfo as? ActivityData else { return }
        show(with: activityData)
    }
    
    @objc private func hideTimerFired(_ timer: Timer) {
        hideTimer?.invalidate()
        hideTimer = nil
        if isStopAnimatingCalled {
            hide()
        }
    }
    
    // MARK: - Helpers
    
    private func show(with activityData: ActivityData) {
        let activityContainer: UIView = UIView(frame: UIScreen.main.bounds)
        
        activityContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityContainer.restorationIdentifier = restorationIdentifier
        
        let actualSize = activityData.size
        let activityIndicatorView = NVActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: actualSize.width, height: actualSize.height),
            type: activityData.type,
            color: activityData.color,
            padding: activityData.padding)
        
        activityIndicatorView.center = activityContainer.center
        activityIndicatorView.startAnimating()
        activityContainer.addSubview(activityIndicatorView)
        
        if let message = activityData.message , !message.isEmpty {
            let label = UILabel()
            
            label.textAlignment = .center
            label.text = message
            label.font = activityData.messageFont
            label.textColor = activityIndicatorView.color
            label.numberOfLines = 0
            label.sizeToFit()
            if label.bounds.size.width > activityContainer.bounds.size.width {
                let maxWidth = activityContainer.bounds.size.width - 16
                
                label.bounds.size = NSString(string: message).boundingRect(with: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: label.font], context: nil).size
            }
            label.center = CGPoint(
                x: activityIndicatorView.center.x,
                y: activityIndicatorView.center.y + actualSize.height + label.bounds.size.height / 2 + 8)
            activityContainer.addSubview(label)
        }
        
        hideTimer = scheduledTimer(activityData.minimumDisplayTime, selector: #selector(hideTimerFired(_:)), data: nil)
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(activityContainer)
    }
    
    private func hide() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        for item in keyWindow.subviews
            where item.restorationIdentifier == restorationIdentifier {
                item.removeFromSuperview()
        }
        showTimer?.invalidate()
        showTimer = nil
    }
    
    private func scheduledTimer(_ timeInterval: Int, selector: Selector, data: ActivityData?) -> Timer {
        return Timer.scheduledTimer(timeInterval: Double(timeInterval) / 1000,
                                    target: self,
                                    selector: selector,
                                    userInfo: data,
                                    repeats: false)
    }
}
