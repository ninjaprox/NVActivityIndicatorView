//
//  NVActivityIndicatorAnimationCubeTransition.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/24/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationCubeTransition: NVActivityIndicatorAnimationDelegate {

    func setUpAnimationInLayer(_ layer: CALayer, size: CGSize, color: UIColor) {
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
            NSValue(cgSize: CGSize(width: 0, height: 0))
        ]
        translateAnimation.duration = duration
        
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.timingFunctions = scaleAnimation.timingFunctions
        rotateAnimation.values = [0, CGFloat(-M_PI_2), CGFloat(-M_PI), CGFloat(-1.5 * M_PI), CGFloat(-2 * M_PI)]
        rotateAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, translateAnimation, rotateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw squares
        for i in 0 ..< 2 {
            let square = NVActivityIndicatorShape.rectangle.createLayerWith(size: CGSize(width: squareSize, height: squareSize), color: color)
            let frame = CGRect(x: x, y: y, width: squareSize, height: squareSize)
            
            animation.beginTime = beginTime + beginTimes[i]
            square.frame = frame
            square.add(animation, forKey: "animation")
            layer.addSublayer(square)
        }
    }
}
