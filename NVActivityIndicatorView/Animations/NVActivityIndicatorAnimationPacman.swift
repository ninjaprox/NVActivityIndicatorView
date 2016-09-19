//
//  NVActivityIndicatorAnimationPacman.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/25/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationPacman: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        circleInLayer(layer, size: size, color: color)
        pacmanInLayer(layer, size: size, color: color)
    }
    
    func pacmanInLayer(_ layer: CALayer, size: CGSize, color: UIColor) {
        let pacmanSize = 2 * size.width / 3
        let pacmanDuration: CFTimeInterval = 0.5
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        // Stroke start animation
        let strokeStartAnimation = CAKeyframeAnimation(keyPath: "strokeStart")
        
        strokeStartAnimation.keyTimes = [0, 0.5, 1]
        strokeStartAnimation.timingFunctions = [timingFunction, timingFunction]
        strokeStartAnimation.values = [0.125, 0, 0.125]
        strokeStartAnimation.duration = pacmanDuration
        
        // Stroke end animation
        let strokeEndAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        
        strokeEndAnimation.keyTimes = [0, 0.5, 1]
        strokeEndAnimation.timingFunctions = [timingFunction, timingFunction]
        strokeEndAnimation.values = [0.875, 1, 0.875]
        strokeEndAnimation.duration = pacmanDuration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [strokeStartAnimation, strokeEndAnimation]
        animation.duration = pacmanDuration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw pacman
        let pacman = NVActivityIndicatorShape.pacman.layerWith(size: CGSize(width: pacmanSize, height: pacmanSize), color: color)
        let frame = CGRect(
            x: (layer.bounds.size.width - size.width) / 2,
            y: (layer.bounds.size.height - pacmanSize) / 2,
            width: pacmanSize,
            height: pacmanSize
        )
        
        pacman.frame = frame
        pacman.add(animation, forKey: "animation")
        layer.addSublayer(pacman)
    }
    
    func circleInLayer(_ layer: CALayer, size: CGSize, color: UIColor) {
        let circleSize = size.width / 5
        let circleDuration: CFTimeInterval = 1
        
        // Translate animation
        let translateAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        
        translateAnimation.fromValue = 0
        translateAnimation.toValue = -size.width / 2
        translateAnimation.duration = circleDuration
        
        // Opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = circleDuration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [translateAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = circleDuration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        let frame = CGRect(
            x: (layer.bounds.size.width - size.width) / 2 + size.width - circleSize,
            y: (layer.bounds.size.height - circleSize) / 2,
            width: circleSize,
            height: circleSize
        )
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
