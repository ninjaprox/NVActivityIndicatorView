//
//  NVActivityIndicatorAnimationBallZigZag.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit
import QuartzCore

class NVActivityIndicatorAnimationBallZigZag: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let circleSize: CGFloat = size.width / 5
        let duration: CFTimeInterval = 0.7
        let deltaX = size.width / 2 - circleSize / 2
        let deltaY = size.height / 2 - circleSize / 2
        let frame = CGRect(x: (layer.bounds.size.width - circleSize) / 2, y: (layer.bounds.size.height - circleSize) / 2, width: circleSize, height: circleSize)
        
        // Circle 1 animation
        let animation = CAKeyframeAnimation(keyPath:"transform")
        
        animation.keyTimes = [0.0, 0.33, 0.66, 1.0]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animation.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-deltaX, -deltaY, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(deltaX, -deltaY, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw circle 1
        circleAt(frame: frame, layer: layer, size: CGSize(width: circleSize, height: circleSize), color: color, animation: animation)
        
        // Circle 2 animation
        animation.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(deltaX, deltaY, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-deltaX, deltaY, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))]
        
        // Draw circle 2
        circleAt(frame: frame, layer: layer, size: CGSize(width: circleSize, height: circleSize), color: color, animation: animation)
    }
    
    func circleAt(frame frame: CGRect, layer: CALayer, size: CGSize, color: UIColor, animation: CAAnimation) {
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: size, color: color)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
