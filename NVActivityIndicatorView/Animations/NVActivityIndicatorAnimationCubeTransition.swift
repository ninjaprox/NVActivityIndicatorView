//
//  NVActivityIndicatorAnimationCubeTransition.swift
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

class NVActivityIndicatorAnimationCubeTransition: NVActivityIndicatorAnimationDelegate {

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let squareSize = size.width / 5
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let deltaX = size.width - squareSize
        let deltaY = size.height - squareSize
        let duration: CFTimeInterval = 1.6
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [0, -0.8]
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        scaleAnimation.values = [1, 0.5, 1, 0.5, 1]
        scaleAnimation.duration = duration

        // Translate animation
        let translateAnimation = CAKeyframeAnimation(keyPath: "transform.translation")

        translateAnimation.keyTimes = scaleAnimation.keyTimes
        translateAnimation.timingFunctions = scaleAnimation.timingFunctions
        translateAnimation.values = [
            NSValue(cgSize: CGSize(width: 0, height: 0)),
            NSValue(cgSize: CGSize(width: deltaX, height: 0)),
            NSValue(cgSize: CGSize(width: deltaX, height: deltaY)),
            NSValue(cgSize: CGSize(width: 0, height: deltaY)),
            NSValue(cgSize: CGSize(width: 0, height: 0)),
        ]
        translateAnimation.duration = duration

        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.timingFunctions = scaleAnimation.timingFunctions
        rotateAnimation.values = [0, -CGFloat.pi / 2, -CGFloat.pi, -1.5 * CGFloat.pi, -2 * CGFloat.pi]
        rotateAnimation.duration = duration

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, translateAnimation, rotateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw squares
        for i in 0 ..< 2 {
            let square = NVActivityIndicatorShape.rectangle.layerWith(size: CGSize(width: squareSize, height: squareSize), color: color)
            let frame = CGRect(x: x, y: y, width: squareSize, height: squareSize)

            animation.beginTime = beginTime + beginTimes[i]
            square.frame = frame
            square.add(animation, forKey: "animation")
            layer.addSublayer(square)
        }
    }
}
