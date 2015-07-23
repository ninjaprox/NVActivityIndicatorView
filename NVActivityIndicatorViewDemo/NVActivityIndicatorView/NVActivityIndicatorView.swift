//
//  NVActivityIndicatorView.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

enum NVActivityIndicatorType {
    case Blank
    case BallPulse
    case BallGridPulse
    case BallClipRotate
    case BallClipRotatePulse
    case BallClipRotateMultiple
    case BallRotate
    case BallZigZag
    case BallZigZagDeflect
    case BallTrianglePath
}

class NVActivityIndicatorView: UIView {
    private let DEFAULT_TYPE: NVActivityIndicatorType = .Blank
    private let DEFAULT_COLOR = UIColor.whiteColor()
    private let DEFAULT_SIZE: CGSize = CGSize(width: 40, height: 40)
    
    private var type: NVActivityIndicatorType
    private var color: UIColor
    private var size: CGSize
    
    var animating: Bool = false
    
    required init(coder aDecoder: NSCoder) {
        self.type = DEFAULT_TYPE
        self.color = DEFAULT_COLOR
        self.size = DEFAULT_SIZE
        super.init(coder: aDecoder);
    }
    
    init(frame: CGRect, type: NVActivityIndicatorType, color: UIColor?, size: CGSize?) {
        self.type = type
        self.color = DEFAULT_COLOR
        self.size = DEFAULT_SIZE
        super.init(frame: frame)
        
        if let _color = color {
            self.color = _color
        }
        if let _size = size {
            self.size = _size
        }
    }
    
    convenience init(frame: CGRect, type: NVActivityIndicatorType, color: UIColor?) {
        self.init(frame: frame, type: type, color: color, size: nil)
    }
    
    convenience init(frame: CGRect, type: NVActivityIndicatorType) {
        self.init(frame: frame, type: type, color: nil)
    }
    
    func startAnimation() {
        if (self.layer.sublayers == nil) {
            setUpAnimation()
        }
        self.layer.speed = 1
        self.animating = true
    }
    
    func stopAnimation() {
        self.layer.speed = 0
        self.animating = false
    }
    
    private func setUpAnimation() {
        let animation: protocol<NVActivityIndicatorAnimationDelegate> = animationOfType(self.type)
        
        self.layer.sublayers = nil
        animation.setUpAnimationInLayer(self.layer, size: self.size, color: self.color)
    }
    
    private func animationOfType(type: NVActivityIndicatorType) -> protocol<NVActivityIndicatorAnimationDelegate> {
        switch type {
        case .Blank:
            return NVActivityIndicatorAnimationBlank()
        case .BallPulse:
            return NVActivityIndicatorAnimationBallPulse()
        case .BallGridPulse:
            return NVActivityIndicatorAnimationBallGridPulse()
        case .BallClipRotate:
            return NVActivityIndicatorAnimationBallClipRotate()
        case .BallClipRotatePulse:
            return NVActivityIndicatorAnimationBallClipRotatePulse()
        case .BallClipRotateMultiple:
            return NVActivityIndicatorAnimationBallClipRotateMultiple()
        case .BallRotate:
            return NVActivityIndicatorAnimationBallRotate()
        case .BallZigZag:
            return NVActivityIndicatorAnimationBallZigZag()
        case .BallZigZagDeflect:
            return NVActivityIndicatorAnimationBallZigZagDeflect()
        case .BallTrianglePath:
            return NVActivityIndicatorAnimationBallTrianglePath()
        }
    }
}
