//
//  NVActivityIndicatorView.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

public enum NVActivityIndicatorType {
    case Blank
    case BallPulse
    case BallGridPulse
    case BallClipRotate
    case SquareSpin
    case BallClipRotatePulse
    case BallClipRotateMultiple
    case BallPulseRise
    case BallRotate
    case CubeTransition
    case BallZigZag
    case BallZigZagDeflect
    case BallTrianglePath
    case BallScale
    case LineScale
    case LineScaleParty
    case BallScaleMultiple
    case BallPulseSync
    case BallBeat
    case LineScalePulseOut
    case LineScalePulseOutRapid
    case BallScaleRipple
    case BallScaleRippleMultiple
    case BallSpinFadeLoader
    case LineSpinFadeLoader
    case TriangleSkewSpin
    case Pacman
    case BallGridBeat
    case SemiCircleSpin
}

public class NVActivityIndicatorView: UIView {
    private let DEFAULT_TYPE: NVActivityIndicatorType = .Pacman
    private let DEFAULT_COLOR = UIColor.whiteColor()
    private let DEFAULT_SIZE: CGSize = CGSize(width: 40, height: 40)
    
    private var type: NVActivityIndicatorType
    private var color: UIColor
    private var size: CGSize
    
    var animating: Bool = false
    var hidesWhenStopped: Bool = true
    
    /**
        Create a activity indicator view with default type, color and size
        This is used by storyboard to initiate the view
    
        - Default type is pacman\n
        - Default color is white\n
        - Default size is 40
    
        :param: decoder
    
        :returns: The activity indicator view
    */
    required public init(coder aDecoder: NSCoder) {
        self.type = DEFAULT_TYPE
        self.color = DEFAULT_COLOR
        self.size = DEFAULT_SIZE
        super.init(coder: aDecoder);
    }
    
    /**
        Create a activity indicator view with specified type, color, size and size
        
        :param: frame view's frame
        :param: type animation type, value of NVActivityIndicatorType enum
        :param: color color of activity indicator view
        :param: size actual size of animation in view
    
        :returns: The activity indicator view
    */
    public init(frame: CGRect, type: NVActivityIndicatorType, color: UIColor?, size: CGSize?) {
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
    
    /**
        Create a activity indicator view with specified type, color and default size
    
        - Default size is 40
        
        :param: frame view's frame
        :param: value animation type, value of NVActivityIndicatorType enum
        :param: color color of activity indicator view
    
        :returns: The activity indicator view
    */
    convenience public init(frame: CGRect, type: NVActivityIndicatorType, color: UIColor?) {
        self.init(frame: frame, type: type, color: color, size: nil)
    }
    
    /**
        Create a activity indicator view with specified type and default color, size
    
        - Default color is white
        - Default size is 40
    
        :param: view view's frame
        :param: value animation type, value of NVActivityIndicatorType enum
    
        :returns: The activity indicator view
    */
    convenience public init(frame: CGRect, type: NVActivityIndicatorType) {
        self.init(frame: frame, type: type, color: nil)
    }
    
    /**
        Start animation
    */
    public func startAnimation() {
        if hidesWhenStopped && hidden {
            hidden = false
        }
        if (self.layer.sublayers == nil) {
            setUpAnimation()
        }
        self.layer.speed = 1
        self.animating = true
    }
    
    /**
        Stop animation
    */
    public func stopAnimation() {
        self.layer.speed = 0
        self.animating = false
        if hidesWhenStopped && !hidden {
            hidden = true
        }
    }
    
    // MARK: Privates
    
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
        case .SquareSpin:
            return NVActivityIndicatorAnimationSquareSpin()
        case .BallClipRotatePulse:
            return NVActivityIndicatorAnimationBallClipRotatePulse()
        case .BallClipRotateMultiple:
            return NVActivityIndicatorAnimationBallClipRotateMultiple()
        case .BallPulseRise:
            return NVActivityIndicatorAnimationBallPulseRise()
        case .BallRotate:
            return NVActivityIndicatorAnimationBallRotate()
        case .CubeTransition:
            return NVActivityIndicatorAnimationCubeTransition()
        case .BallZigZag:
            return NVActivityIndicatorAnimationBallZigZag()
        case .BallZigZagDeflect:
            return NVActivityIndicatorAnimationBallZigZagDeflect()
        case .BallTrianglePath:
            return NVActivityIndicatorAnimationBallTrianglePath()
        case .BallScale:
            return NVActivityIndicatorAnimationBallScale()
        case .LineScale:
            return NVActivityIndicatorAnimationLineScale()
        case .LineScaleParty:
            return NVActivityIndicatorAnimationLineScaleParty()
        case .BallScaleMultiple:
            return NVActivityIndicatorAnimationBallScaleMultiple()
        case .BallPulseSync:
            return NVActivityIndicatorAnimationBallPulseSync()
        case .BallBeat:
            return NVActivityIndicatorAnimationBallBeat()
        case .LineScalePulseOut:
            return NVActivityIndicatorAnimationLineScalePulseOut()
        case .LineScalePulseOutRapid:
            return NVActivityIndicatorAnimationLineScalePulseOutRapid()
        case .BallScaleRipple:
            return NVActivityIndicatorAnimationBallScaleRipple()
        case .BallScaleRippleMultiple:
            return NVActivityIndicatorAnimationBallScaleRippleMultiple()
        case .BallSpinFadeLoader:
            return NVActivityIndicatorAnimationBallSpinFadeLoader()
        case .LineSpinFadeLoader:
            return NVActivityIndicatorAnimationLineSpinFadeLoader()
        case .TriangleSkewSpin:
            return NVActivityIndicatorAnimationTriangleSkewSpin()
        case .Pacman:
            return NVActivityIndicatorAnimationPacman()
        case .BallGridBeat:
            return NVActivityIndicatorAnimationBallGridBeat()
        case .SemiCircleSpin:
            return NVActivityIndicatorAnimationSemiCircleSpin()
        }
    }
}
