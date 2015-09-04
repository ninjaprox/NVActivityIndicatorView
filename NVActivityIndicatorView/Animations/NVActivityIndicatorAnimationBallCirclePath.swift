//
//  NVActivityIndicatorAnimationInfinityPath.swift
//  
//
//  Created by Brendan Kirchner on 8/5/15.
//
//

import UIKit

class NVActivityIndicatorAnimationBallCirclePath: NVActivityIndicatorAnimationDelegate {
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        circleInLayer(layer, size: size, color: color)
    }
    
    func circleInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        
        let minDimen = min(size.width, size.height)
        
        let circleSize = size.width / 5
        let radius = minDimen / 2
        let circleDuration: CFTimeInterval = 1
        
        // Left animation
        let start = CGPoint(x: (layer.bounds.width - minDimen) / 2, y: layer.bounds.height / 2)
        let rect = CGRect(x: start.x, y: start.y - radius, width: 2 * radius, height: 2 * radius)
        
        let path = CGPathCreateWithEllipseInRect(rect, nil)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path
        animation.removedOnCompletion = false
        animation.repeatCount = HUGE
        animation.duration = circleDuration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.calculationMode = kCAAnimationPaced
        
        // Draw circles
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        let frame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: layer.bounds.height / 2,
            width: circleSize,
            height: circleSize
        )
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
   
}
