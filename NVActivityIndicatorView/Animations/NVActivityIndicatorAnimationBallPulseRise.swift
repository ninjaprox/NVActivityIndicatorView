//
//  NVActivityIndicatorAnimationBallPulseRise.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/24/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallPulseRise: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let circleSpacing: CGFloat = 2
        let circleSize = (size.width - 4 * circleSpacing) / 5
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - circleSize) / 2
        let deltaY = size.height / 2
        let duration: CFTimeInterval = 1
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.15, 0.46, 0.9, 0.6)
        let oddAnimation = self.oddAnimation(duration: duration, deltaY: deltaY, timingFunction: timingFunction)
        let evenAnimation = self.evenAnimation(duration: duration, deltaY: deltaY, timingFunction: timingFunction)
        
        // Draw circles
        for i in 0 ..< 5 {
            let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                y: y,
                width: circleSize,
                height: circleSize)
            
            circle.frame = frame
            if i % 2 == 0 {
                circle.addAnimation(evenAnimation, forKey: "animation")
            } else {
                circle.addAnimation(oddAnimation, forKey: "animation")
            }
            layer.addSublayer(circle)
        }
    }
    
    func oddAnimation(duration duration: CFTimeInterval, deltaY: CGFloat, timingFunction: CAMediaTimingFunction) -> CAAnimation {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction]
        scaleAnimation.values = [0.4, 1.1, 0.75]
        scaleAnimation.duration = duration
        
        // Translate animation
        let translateAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        
        translateAnimation.keyTimes = [0, 0.25, 0.75, 1]
        translateAnimation.timingFunctions = [timingFunction, timingFunction, timingFunction]
        translateAnimation.values = [0, deltaY, -deltaY, 0]
        translateAnimation.duration = duration
        
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, translateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        return animation
    }
    
    func evenAnimation(duration  duration: CFTimeInterval, deltaY: CGFloat, timingFunction: CAMediaTimingFunction) -> CAAnimation {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction]
        scaleAnimation.values = [1.1, 0.4, 1]
        scaleAnimation.duration = duration
        
        // Translate animation
        let translateAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        
        translateAnimation.keyTimes = [0, 0.25, 0.75, 1]
        translateAnimation.timingFunctions = [timingFunction, timingFunction, timingFunction]
        translateAnimation.values = [0, -deltaY, deltaY, 0]
        translateAnimation.duration = duration
        
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, translateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        return animation
    }
}
