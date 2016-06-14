//
//  NVActivityIndicatorAnimationAudioEqualizer.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 6/14/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationAudioEqualizer: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - lineSize * 7) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: [CFTimeInterval] = [4.3, 2.5, 1.7, 3.1]
        let values = [0, 0.7, 0.4, 0.05, 0.95, 0.3, 0.9, 0.4, 0.15, 0.18, 0.75, 0.01]
        
        // Draw lines
        for i in 0 ..< 4 {
            let animation = CAKeyframeAnimation()
            
            animation.keyPath = "path"
            animation.additive = true
            animation.values = []
            
            for j in 0 ..< values.count {
                let heightFactor = values[j]
                let height = size.height * CGFloat(heightFactor)
                let point = CGPointMake(0, size.height - height)
                let path = UIBezierPath(rect: CGRect(origin: point, size: CGSize(width: lineSize, height: height)))
                
                animation.values?.append(path.CGPath)
            }
            animation.duration = duration[i]
            animation.repeatCount = HUGE
            animation.removedOnCompletion = false
            
            let line = NVActivityIndicatorShape.Line.createLayerWith(size: CGSize(width: lineSize, height: size.height), color: color)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                               y: y,
                               width: lineSize,
                               height: size.height)
            
            line.frame = frame
            line.addAnimation(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
}