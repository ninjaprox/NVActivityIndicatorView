//
//  CustomActivityIndicator.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Basem Emara on 6/12/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

class CustomActivityIndicator: NVActivityIndicatorAnimationDelegate {

    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: [CFTimeInterval] = [4.3, 2.5, 1.7, 3.1]
        let beginTime = CACurrentMediaTime()

        let values = [0, 0.7, 0.4, 0.05, 0.95, 0.3, 0.9, 0.4, 0.15, 0.18, 0.75, 0.01]
        
        // Draw lines
        for i in 0 ..< 4 {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "path"
            animation.additive = true
            animation.values = []

            for j in 0 ..< values.count {
                var point = CGPointZero
                let htFactor = values[j]
                let ht = size.height * CGFloat(htFactor)
                point.y = point.y + (size.height - ht)
                let path = UIBezierPath(rect: CGRect(origin: point, size: CGSize(width: lineSize, height: ht)))

                animation.values?.append(path.CGPath)
            }

            let line = NVActivityIndicatorShape.Line.createLayerWith(size: CGSize(width: lineSize, height: size.height), color: color)

            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                y: y,
                width: lineSize,
                height: size.height)

            animation.duration = duration[i]
            animation.repeatCount = HUGE
            animation.removedOnCompletion = false

            animation.beginTime = beginTime
            line.frame = frame
            line.addAnimation(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
}