//
//  NVActivityIndicatorShape.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/22/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

enum NVActivityIndicatorShape {
    case Circle
    case CircleSemi
    case Ring
    case RingTwoHalfVertical
    case RingTwoHalfHorizontal
    case RingThirdFour
    case Rectangle
    case Triangle
    case Line
    case Pacman
    
    func createLayerWith(size size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        var path: UIBezierPath = UIBezierPath()
        let lineWidth: CGFloat = 2
        
        switch self {
        case .Circle:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 2,
                startAngle: 0,
                endAngle: CGFloat(2 * M_PI),
                clockwise: false);
            layer.fillColor = color.CGColor
        case .CircleSemi:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 2,
                startAngle: CGFloat(-M_PI / 6),
                endAngle: CGFloat(-5 * M_PI / 6),
                clockwise: false)
            path.closePath()
            layer.fillColor = color.CGColor
        case .Ring:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 2,
                startAngle: 0,
                endAngle: CGFloat(2 * M_PI),
                clockwise: false);
            layer.fillColor = nil
            layer.strokeColor = color.CGColor
            layer.lineWidth = lineWidth
        case .RingTwoHalfVertical:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius:size.width / 2,
                startAngle:CGFloat(-3 * M_PI_4),
                endAngle:CGFloat(-M_PI_4),
                clockwise:true)
            path.moveToPoint(
                CGPoint(x: size.width / 2 - size.width / 2 * CGFloat(cos(M_PI_4)),
                    y: size.height / 2 + size.height / 2 * CGFloat(sin(M_PI_4)))
            )
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius:size.width / 2,
                startAngle:CGFloat(-5 * M_PI_4),
                endAngle:CGFloat(-7 * M_PI_4),
                clockwise:false)
            layer.fillColor = nil
            layer.strokeColor = color.CGColor
            layer.lineWidth = lineWidth
        case .RingTwoHalfHorizontal:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius:size.width / 2,
                startAngle:CGFloat(3 * M_PI_4),
                endAngle:CGFloat(5 * M_PI_4),
                clockwise:true)
            path.moveToPoint(
                CGPoint(x: size.width / 2 + size.width / 2 * CGFloat(cos(M_PI_4)),
                    y: size.height / 2 - size.height / 2 * CGFloat(sin(M_PI_4)))
            )
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius:size.width / 2,
                startAngle:CGFloat(-M_PI_4),
                endAngle:CGFloat(M_PI_4),
                clockwise:true)
            layer.fillColor = nil
            layer.strokeColor = color.CGColor
            layer.lineWidth = lineWidth
        case .RingThirdFour:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 2,
                startAngle: CGFloat(-3 * M_PI_4),
                endAngle: CGFloat(-M_PI_4),
                clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.CGColor
            layer.lineWidth = 2
        case .Rectangle:
            path.moveToPoint(CGPoint(x: 0, y: 0))
            path.addLineToPoint(CGPoint(x: size.width, y: 0))
            path.addLineToPoint(CGPoint(x: size.width, y: size.height))
            path.addLineToPoint(CGPoint(x: 0, y: size.height))
            layer.fillColor = color.CGColor
        case .Triangle:
            let offsetY = size.height / 4
            
            path.moveToPoint(CGPoint(x: 0, y: size.height - offsetY))
            path.addLineToPoint(CGPoint(x: size.width / 2, y: size.height / 2 - offsetY))
            path.addLineToPoint(CGPoint(x: size.width, y: size.height - offsetY))
            path.closePath()
            layer.fillColor = color.CGColor
        case .Line:
            path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height),
                cornerRadius: size.width / 2)
            layer.fillColor = color.CGColor
        case .Pacman:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 4,
                startAngle: 0,
                endAngle: CGFloat(2 * M_PI),
                clockwise: true);
            layer.fillColor = nil
            layer.strokeColor = color.CGColor
            layer.lineWidth = size.width / 2
        }
        
        layer.backgroundColor = nil
        layer.path = path.CGPath
        layer.frame = CGRectMake(0, 0, size.width, size.height)
        
        return layer
    }
}