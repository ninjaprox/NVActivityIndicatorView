//
//  NVActivityIndicatorAnimationBallScaleMultiple.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/24/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallScaleMultiple: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.2, 0.4]
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = duration
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = duration
        opacityAnimation.keyTimes = [0, 0.05, 1]
        opacityAnimation.values = [0, 1, 0]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw balls
        for i in 0 ..< 3 {
            let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: size, color: color)
            let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                y: (layer.bounds.size.height - size.height) / 2,
                width: size.width,
                height: size.height)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.opacity = 0
            circle.addAnimation(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}
