//
//  NVActivityIndicatorAnimationBallDoubleBounce.swift
//  NVActivityIndicatorView
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

class NVActivityIndicatorAnimationBallDoubleBounce: NVActivityIndicatorAnimationDelegate {

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        for index in (0...1) {
            bouncingBall(in: layer, size: size, color: color, startingAt: CACurrentMediaTime() + Double(-1 * index))
        }
    }

    fileprivate func bouncingBall(in layer: CALayer, size: CGSize, color: UIColor, startingAt: CFTimeInterval) {
        let duration: CFTimeInterval = 2

        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = duration
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [0, 1, 0]

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation]
        #if swift(>=4.2)
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        #else
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEasyInEaseOut)
        #endif
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        let circle = NVActivityIndicatorShape.circle.layerWith(size: size, color: color)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)

        animation.beginTime = startingAt
        circle.frame = frame
        circle.opacity = 0.6
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
