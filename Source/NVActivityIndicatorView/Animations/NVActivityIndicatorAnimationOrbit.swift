//
//  NVActivityIndicatorAnimationOrbit.swift
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

class NVActivityIndicatorAnimationOrbit: NVActivityIndicatorAnimationDelegate {
    let duration: CFTimeInterval = 1.9
    let satelliteCoreRatio: CGFloat = 0.25
    let distanceRatio: CGFloat = 1.5 // distance / core size

    var coreSize: CGFloat = 0
    var satelliteSize: CGFloat = 0

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        coreSize = size.width / (1 + satelliteCoreRatio + distanceRatio)
        satelliteSize = coreSize * satelliteCoreRatio

        ring1InLayer(layer, size: size, color: color)
        ring2InLayer(layer, size: size, color: color)
        coreInLayer(layer, size: size, color: color)
        satelliteInLayer(layer, size: size, color: color)
    }

    func ring1InLayer(_ layer: CALayer, size _: CGSize, color: UIColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.45, 0.45, 1]
        #if swift(>=4.2)
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        #else
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif
        scaleAnimation.values = [0, 0, 1.3, 2]
        scaleAnimation.duration = duration

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)

        opacityAnimation.keyTimes = [0, 0.45, 1]
        #if swift(>=4.2)
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear), timingFunction]
        #else
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        #endif
        opacityAnimation.values = [0.8, 0.8, 0]
        opacityAnimation.duration = duration

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)

        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func ring2InLayer(_ layer: CALayer, size _: CGSize, color: UIColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.55, 0.55, 1]
        #if swift(>=4.2)
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        #else
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif
        scaleAnimation.values = [0, 0, 1.3, 2.1]
        scaleAnimation.duration = duration

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)

        opacityAnimation.keyTimes = [0, 0.55, 0.65, 1]
        #if swift(>=4.2)
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear), timingFunction]
        #else
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        #endif
        opacityAnimation.values = [0.7, 0.7, 0, 0]
        opacityAnimation.duration = duration

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)

        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func coreInLayer(_ layer: CALayer, size _: CGSize, color: UIColor) {
        let inTimingFunction = CAMediaTimingFunction(controlPoints: 0.7, 0, 1, 0.5)
        let outTimingFunction = CAMediaTimingFunction(controlPoints: 0, 0.7, 0.5, 1)
        #if swift(>=4.2)
        let standByTimingFunction = CAMediaTimingFunction(name: .linear)
        #else
        let standByTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif

        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.45, 0.55, 1]
        scaleAnimation.timingFunctions = [inTimingFunction, standByTimingFunction, outTimingFunction]
        scaleAnimation.values = [1, 1.3, 1.3, 1]
        scaleAnimation.duration = duration
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)

        circle.frame = frame
        circle.add(scaleAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func satelliteInLayer(_ layer: CALayer, size: CGSize, color: UIColor) {
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "position")

        rotateAnimation.path = UIBezierPath(arcCenter: CGPoint(x: layer.bounds.midX, y: layer.bounds.midY),
                                            radius: (size.width - satelliteSize) / 2,
                                            startAngle: CGFloat(Double.pi * 1.5),
                                            endAngle: CGFloat(Double.pi * 1.5 + 4 * Double.pi),
                                            clockwise: true).cgPath
        rotateAnimation.duration = duration * 2
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: satelliteSize, height: satelliteSize), color: color)
        let frame = CGRect(x: 0, y: 0, width: satelliteSize, height: satelliteSize)

        circle.frame = frame
        circle.add(rotateAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
