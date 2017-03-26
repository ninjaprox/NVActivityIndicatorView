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

    /// Color of text.
    let textColor: UIColor

    /// Padding of activity indicator view.
    let padding: CGFloat

    /// Display time threshold to actually display UI blocker.
    let displayTimeThreshold: Int

    /// Minimum display time of UI blocker.
    let minimumDisplayTime: Int

    /// Background color of the UI blocker
    let backgroundColor: UIColor

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
     - parameter textColor:            color of the text below the activity indicator view. Will match color parameter if not set, otherwise DEFAULT_TEXT_COLOR if color is not set.

     - returns: The information package used to display UI blocker.
     */
    public init(size: CGSize? = nil,
                message: String? = nil,
                messageFont: UIFont? = nil,
                type: NVActivityIndicatorType? = nil,
                color: UIColor? = nil,
                padding: CGFloat? = nil,
                displayTimeThreshold: Int? = nil,
                minimumDisplayTime: Int? = nil,
                backgroundColor: UIColor? = nil,
                textColor: UIColor? = nil) {
        self.size = size ?? NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE
        self.message = message ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE
        self.messageFont = messageFont ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT
        self.type = type ?? NVActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? NVActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? NVActivityIndicatorView.DEFAULT_PADDING
        self.displayTimeThreshold = displayTimeThreshold ?? NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD
        self.minimumDisplayTime = minimumDisplayTime ?? NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME
        self.backgroundColor = backgroundColor ?? NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR
        self.textColor = textColor ?? color ?? NVActivityIndicatorView.DEFAULT_TEXT_COLOR
    }
}

/// Presenter that displays NVActivityIndicatorView as UI blocker.
public final class NVActivityIndicatorPresenter {
    private enum State {
        case waitingToShow
        case showed
        case waitingToHide
        case hidden
    }

    private let restorationIdentifier = "NVActivityIndicatorViewContainer"
    private let messageLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private var state: State = .hidden
    private let startAnimatingGroup = DispatchGroup()

    /// Shared instance of `NVActivityIndicatorPresenter`.
    public static let sharedInstance = NVActivityIndicatorPresenter()

    private init() {}

    // MARK: - Public interface

    /**
     Display UI blocker.

     - parameter data: Information package used to display UI blocker.
     */
    public final func startAnimating(_ data: ActivityData) {
        guard state == .hidden else { return }

        state = .waitingToShow
        startAnimatingGroup.enter()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(data.displayTimeThreshold)) {
            guard self.state == .waitingToShow else {
                self.startAnimatingGroup.leave()

                return
            }

            self.show(with: data)
            self.startAnimatingGroup.leave()
        }
    }

    /**
     Remove UI blocker.
     */
    public final func stopAnimating() {
        _hide()
    }

    /// Set message displayed under activity indicator view.
    ///
    /// - Parameter message: message displayed under activity indicator view.
    public final func setMessage(_ message: String?) {
        guard state == .showed else {
            startAnimatingGroup.notify(queue: DispatchQueue.main) {
                self.messageLabel.text = message
            }

            return
        }

        messageLabel.text = message
    }

    // MARK: - Helpers

    private func show(with activityData: ActivityData) {
        let containerView = UIView(frame: UIScreen.main.bounds)

        containerView.backgroundColor = activityData.backgroundColor
        containerView.restorationIdentifier = restorationIdentifier
        containerView.translatesAutoresizingMaskIntoConstraints = false

        let activityIndicatorView = NVActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: activityData.size.width, height: activityData.size.height),
            type: activityData.type,
            color: activityData.color,
            padding: activityData.padding)

        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(activityIndicatorView)

        // Add constraints for `activityIndicatorView`.
        ({
            let xConstraint = NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerY, multiplier: 1, constant: 0)

            containerView.addConstraints([xConstraint, yConstraint])
        }())

        messageLabel.font = activityData.messageFont
        messageLabel.textColor = activityData.textColor
        messageLabel.text = activityData.message
        containerView.addSubview(messageLabel)

        // Add constraints for `messageLabel`.
        ({
            let leadingConstraint = NSLayoutConstraint(item: containerView, attribute: .leading, relatedBy: .equal, toItem: messageLabel, attribute: .leading, multiplier: 1, constant: -8)
            let trailingConstraint = NSLayoutConstraint(item: containerView, attribute: .trailing, relatedBy: .equal, toItem: messageLabel, attribute: .trailing, multiplier: 1, constant: 8)

            containerView.addConstraints([leadingConstraint, trailingConstraint])
        }())
        ({
            let spacingConstraint = NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: activityIndicatorView, attribute: .bottom, multiplier: 1, constant: 8)

            containerView.addConstraint(spacingConstraint)
        }())

        guard let keyWindow = UIApplication.shared.keyWindow else { return }

        keyWindow.addSubview(containerView)
        state = .showed

        // Add constraints for `containerView`.
        ({
            let leadingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)

            keyWindow.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }())

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(activityData.minimumDisplayTime)) {
            self._hide()
        }
    }

    private func _hide() {
        if state == .waitingToHide {
            hide()
        } else if state != .hidden {
            state = .waitingToHide
        }
    }

    private func hide() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }

        for item in keyWindow.subviews
            where item.restorationIdentifier == restorationIdentifier {
            item.removeFromSuperview()
        }
        state = .hidden
    }
}
