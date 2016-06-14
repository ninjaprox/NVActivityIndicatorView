//
//  NVActivityIndicatorAnimationOrbit.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 6/12/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationOrbit: NVActivityIndicatorAnimationDelegate {
    let duration: CFTimeInterval = 1.9
    let satelliteCoreRatio: CGFloat = 0.25
    let distanceRatio:CGFloat = 1.5 // distance / core size
    
    var coreSize: CGFloat = 0
    var satelliteSize: CGFloat = 0
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        coreSize = size.width / (1 + satelliteCoreRatio + distanceRatio)
        satelliteSize = coreSize * satelliteCoreRatio
        
        ring1InLayer(layer, size: size, color: color)
        ring2InLayer(layer, size: size, color: color)
        coreInLayer(layer, size: size, color: color)
        satelliteInLayer(layer, size: size, color: color)
    }
    
    func ring1InLayer(layer: CALayer, size: CGSize, color: UIColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.45, 0.45, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        scaleAnimation.values = [0, 0, 1.3, 2]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        
        opacityAnimation.keyTimes = [0, 0.45, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        opacityAnimation.values = [0.8, 0.8, 0]
        opacityAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRectMake((layer.bounds.size.width - coreSize) / 2,
                               (layer.bounds.size.height - coreSize) / 2,
                               coreSize,
                               coreSize)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func ring2InLayer(layer: CALayer, size: CGSize, color: UIColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.55, 0.55, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        scaleAnimation.values = [0, 0, 1.3, 2.1]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        
        opacityAnimation.keyTimes = [0, 0.55, 0.65, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        opacityAnimation.values = [0.7, 0.7, 0, 0]
        opacityAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw circle
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRectMake((layer.bounds.size.width - coreSize) / 2,
                               (layer.bounds.size.height - coreSize) / 2,
                               coreSize,
                               coreSize)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func coreInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let inTimingFunction = CAMediaTimingFunction(controlPoints: 0.7, 0, 1, 0.5)
        let outTimingFunction = CAMediaTimingFunction(controlPoints: 0, 0.7, 0.5, 1)
        let standByTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.45, 0.55, 1]
        scaleAnimation.timingFunctions = [inTimingFunction, standByTimingFunction, outTimingFunction];
        scaleAnimation.values = [1, 1.3, 1.3, 1]
        scaleAnimation.duration = duration
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.removedOnCompletion = false
        
        // Draw circle
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRectMake((layer.bounds.size.width - coreSize) / 2,
                               (layer.bounds.size.height - coreSize) / 2,
                               coreSize,
                               coreSize)
        
        circle.frame = frame
        circle.addAnimation(scaleAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func satelliteInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "position")
        
        rotateAnimation.path = UIBezierPath(arcCenter: CGPoint(x: CGRectGetMidX(layer.bounds), y: CGRectGetMidY(layer.bounds)),
                                            radius: (size.width - satelliteSize) / 2,
                                            startAngle: CGFloat(M_PI) * 1.5,
                                            endAngle: CGFloat(M_PI) * 1.5 + 4 * CGFloat(M_PI),
                                            clockwise: true).CGPath
        rotateAnimation.duration = duration * 2
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.removedOnCompletion = false
        
        // Draw circle
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: satelliteSize, height: satelliteSize), color: color)
        let frame = CGRectMake(0, 0, satelliteSize, satelliteSize)
        
        circle.frame = frame
        circle.addAnimation(rotateAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
}