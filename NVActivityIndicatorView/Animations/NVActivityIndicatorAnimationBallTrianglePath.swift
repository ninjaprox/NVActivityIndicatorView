//
//  NVActivityIndicatorAnimationBallTrianglePath.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallTrianglePath: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let circleSize = size.width / 5
        let deltaX = size.width / 2 - circleSize / 2
        let deltaY = size.height / 2 - circleSize / 2
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: CFTimeInterval = 2
        let timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath:"transform")
        
        animation.keyTimes = [0, 0.33, 0.66, 1]
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Top-center circle
        let topCenterCircle = NVActivityIndicatorShape.ring.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values:["{0,0}", "{hx,fy}", "{-hx,fy}", "{0,0}"], deltaX: deltaX, deltaY: deltaY)
        topCenterCircle.frame = CGRect(x: x + size.width / 2 - circleSize / 2, y: y, width: circleSize, height: circleSize)
        topCenterCircle.add(animation, forKey: "animation")
        layer.addSublayer(topCenterCircle)
        
        // Bottom-left circle
        let bottomLeftCircle = NVActivityIndicatorShape.ring.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values: ["{0,0}", "{hx,-fy}", "{fx,0}", "{0,0}"], deltaX: deltaX, deltaY: deltaY)
        bottomLeftCircle.frame = CGRect(x: x, y: y + size.height - circleSize, width: circleSize, height: circleSize)
        bottomLeftCircle.add(animation, forKey: "animation")
        layer.addSublayer(bottomLeftCircle)
        
        // Bottom-right circle
        let bottomRightCircle = NVActivityIndicatorShape.ring.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values: ["{0,0}", "{-fx,0}", "{-hx,-fy}", "{0,0}"], deltaX: deltaX, deltaY:deltaY)
        bottomRightCircle.frame = CGRect(x: x + size.width - circleSize, y: y + size.height - circleSize, width: circleSize, height: circleSize)
        bottomRightCircle.add(animation, forKey: "animation")
        layer.addSublayer(bottomRightCircle)
    }
    
    func changeAnimation(_ animation: CAKeyframeAnimation, values rawValues: [String], deltaX: CGFloat, deltaY: CGFloat) {
        let values = NSMutableArray(capacity: 5)
        
        for rawValue in rawValues {
            let point = CGPointFromString(translateString(rawValue, deltaX: deltaX, deltaY: deltaY))
            
            values.add(NSValue(caTransform3D: CATransform3DMakeTranslation(point.x, point.y, 0)))
        }
        animation.values = values as [AnyObject]
    }
    
    func translateString(_ valueString: String, deltaX: CGFloat, deltaY: CGFloat) -> String {
        let valueMutableString = NSMutableString(string: valueString)
        let fullDeltaX = 2 * deltaX
        let fullDeltaY = 2 * deltaY
        var range = NSMakeRange(0, valueMutableString.length)
        
        valueMutableString.replaceOccurrences(of: "hx", with: "\(deltaX)", options: NSString.CompareOptions.caseInsensitive, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrences(of: "fx", with: "\(fullDeltaX)", options: NSString.CompareOptions.caseInsensitive, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrences(of: "hy", with: "\(deltaY)", options: NSString.CompareOptions.caseInsensitive, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrences(of: "fy", with: "\(fullDeltaY)", options: NSString.CompareOptions.caseInsensitive, range: range)
        
        return valueMutableString as String
    }
}
