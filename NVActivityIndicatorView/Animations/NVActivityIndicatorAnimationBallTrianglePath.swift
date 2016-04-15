//
//  NVActivityIndicatorAnimationBallTrianglePath.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallTrianglePath: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
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
        animation.removedOnCompletion = false
        
        // Top-center circle
        let topCenterCircle = NVActivityIndicatorShape.Ring.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values:["{0,0}", "{hx,fy}", "{-hx,fy}", "{0,0}"], deltaX: deltaX, deltaY: deltaY)
        topCenterCircle.frame = CGRectMake(x + size.width / 2 - circleSize / 2, y, circleSize, circleSize)
        topCenterCircle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(topCenterCircle)
        
        // Bottom-left circle
        let bottomLeftCircle = NVActivityIndicatorShape.Ring.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values: ["{0,0}", "{hx,-fy}", "{fx,0}", "{0,0}"], deltaX: deltaX, deltaY: deltaY)
        bottomLeftCircle.frame = CGRectMake(x, y + size.height - circleSize, circleSize, circleSize)
        bottomLeftCircle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(bottomLeftCircle)
        
        // Bottom-right circle
        let bottomRightCircle = NVActivityIndicatorShape.Ring.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
        
        changeAnimation(animation, values: ["{0,0}", "{-fx,0}", "{-hx,-fy}", "{0,0}"], deltaX: deltaX, deltaY:deltaY)
        bottomRightCircle.frame = CGRectMake(x + size.width - circleSize, y + size.height - circleSize, circleSize, circleSize)
        bottomRightCircle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(bottomRightCircle)
    }
    
    func changeAnimation(animation: CAKeyframeAnimation, values rawValues: [String], deltaX: CGFloat, deltaY: CGFloat) -> CAAnimation {
        let values = NSMutableArray(capacity: 5)
        
        for rawValue in rawValues {
            let point = CGPointFromString(translateString(rawValue, deltaX: deltaX, deltaY: deltaY))
            
            values.addObject(NSValue(CATransform3D: CATransform3DMakeTranslation(point.x, point.y, 0)))
        }
        animation.values = values as [AnyObject]
        
        return animation
    }
    
    func translateString(valueString: String, deltaX: CGFloat, deltaY: CGFloat) -> String {
        let valueMutableString = NSMutableString(string: valueString)
        let fullDeltaX = 2 * deltaX
        let fullDeltaY = 2 * deltaY
        var range = NSMakeRange(0, valueMutableString.length)
        
        valueMutableString.replaceOccurrencesOfString("hx", withString: "\(deltaX)", options: NSStringCompareOptions.CaseInsensitiveSearch, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrencesOfString("fx", withString: "\(fullDeltaX)", options: NSStringCompareOptions.CaseInsensitiveSearch, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrencesOfString("hy", withString: "\(deltaY)", options: NSStringCompareOptions.CaseInsensitiveSearch, range: range)
        range.length = valueMutableString.length
        valueMutableString.replaceOccurrencesOfString("fy", withString: "\(fullDeltaY)", options: NSStringCompareOptions.CaseInsensitiveSearch, range: range)
        
        return valueMutableString as String
    }
}
