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
        let leftStart = CGPoint(x: (layer.bounds.width - size.width) / 2, y: layer.bounds.height / 2)
        let leftRect = CGRect(x: leftStart.x, y: leftStart.y - radius, width: 2 * radius, height: 2 * radius)
        
        let leftPath = CGPathCreateWithEllipseInRect(leftRect, nil)
        
        let animationLeft = CAKeyframeAnimation(keyPath: "position")
        animationLeft.path = leftPath
        animationLeft.removedOnCompletion = false
        animationLeft.repeatCount = HUGE
        animationLeft.duration = circleDuration
        animationLeft.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animationLeft.calculationMode = kCAAnimationPaced
        
        // Draw circles
        let leftCircle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        let leftFrame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: layer.bounds.height / 2,
            width: circleSize,
            height: circleSize
        )
        
        leftCircle.frame = leftFrame
        leftCircle.addAnimation(animationLeft, forKey: "animation")
        layer.addSublayer(leftCircle)
    }
   
}
