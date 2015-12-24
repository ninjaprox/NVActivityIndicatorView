//
//  NVActivityIndicatorView.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

/**
 Enum of animation types used for activity indicator view.
 
 - Blank:                   Blank animation.
 - BallPulse:               BallPulse animation.
 - BallGridPulse:           BallGridPulse animation.
 - BallClipRotate:          BallClipRotate animation.
 - SquareSpin:              SquareSpin animation.
 - BallClipRotatePulse:     BallClipRotatePulse animation.
 - BallClipRotateMultiple:  BallClipRotateMultiple animation.
 - BallPulseRise:           BallPulseRise animation.
 - BallRotate:              BallRotate animation.
 - CubeTransition:          CubeTransition animation.
 - BallZigZag:              BallZigZag animation.
 - BallZigZagDeflect:       BallZigZagDeflect animation.
 - BallTrianglePath:        BallTrianglePath animation.
 - BallScale:               BallScale animation.
 - LineScale:               LineScale animation.
 - LineScaleParty:          LineScaleParty animation.
 - BallScaleMultiple:       BallScaleMultiple animation.
 - BallPulseSync:           BallPulseSync animation.
 - BallBeat:                BallBeat animation.
 - LineScalePulseOut:       LineScalePulseOut animation.
 - LineScalePulseOutRapid:  LineScalePulseOutRapid animation.
 - BallScaleRipple:         BallScaleRipple animation.
 - BallScaleRippleMultiple: BallScaleRippleMultiple animation.
 - BallSpinFadeLoader:      BallSpinFadeLoader animation.
 - LineSpinFadeLoader:      LineSpinFadeLoader animation.
 - TriangleSkewSpin:        TriangleSkewSpin animation.
 - Pacman:                  Pacman animation.
 - BallGridBeat:            BallGridBeat animation.
 - SemiCircleSpin:          SemiCircleSpin animation.
 - BallRotateChase:         BallRotateChase animation.
 */
public enum NVActivityIndicatorType {
    /**
     Blank.
     
     - returns: Instance of NVActivityIndicatorAnimationBlank.
     */
    case Blank
    /**
     BallPulse.
     
     - returns: Instance of NVActivityIndicatorAnimationBallPulse.
     */
    case BallPulse
    /**
     BallGridPulse.
     
     - returns: Instance of NVActivityIndicatorAnimationBallGridPulse.
     */
    case BallGridPulse
    /**
     BallClipRotate.
     
     - returns: Instance of NVActivityIndicatorAnimationBallClipRotate.
     */
    case BallClipRotate
    /**
     SquareSpin.
     
     - returns: Instance of NVActivityIndicatorAnimationSquareSpin.
     */
    case SquareSpin
    /**
     BallClipRotatePulse.
     
     - returns: Instance of NVActivityIndicatorAnimationBallClipRotatePulse.
     */
    case BallClipRotatePulse
    /**
     BallClipRotateMultiple.
     
     - returns: Instance of NVActivityIndicatorAnimationBallClipRotateMultiple.
     */
    case BallClipRotateMultiple
    /**
     BallPulseRise.
     
     - returns: Instance of NVActivityIndicatorAnimationBallPulseRise.
     */
    case BallPulseRise
    /**
     BallRotate.
     
     - returns: Instance of NVActivityIndicatorAnimationBallRotate.
     */
    case BallRotate
    /**
     CubeTransition.
     
     - returns: Instance of NVActivityIndicatorAnimationCubeTransition.
     */
    case CubeTransition
    /**
     BallZigZag.
     
     - returns: Instance of NVActivityIndicatorAnimationBallZigZag.
     */
    case BallZigZag
    /**
     BallZigZagDeflect
     
     - returns: Instance of NVActivityIndicatorAnimationBallZigZagDeflect
     */
    case BallZigZagDeflect
    /**
     BallTrianglePath.
     
     - returns: Instance of NVActivityIndicatorAnimationBallTrianglePath.
     */
    case BallTrianglePath
    /**
     BallScale.
     
     - returns: Instance of NVActivityIndicatorAnimationBallScale.
     */
    case BallScale
    /**
     LineScale.
     
     - returns: Instance of NVActivityIndicatorAnimationLineScale.
     */
    case LineScale
    /**
     LineScaleParty.
     
     - returns: Instance of NVActivityIndicatorAnimationLineScaleParty.
     */
    case LineScaleParty
    /**
     BallScaleMultiple.
     
     - returns: Instance of NVActivityIndicatorAnimationBallScaleMultiple.
     */
    case BallScaleMultiple
    /**
     BallPulseSync.
     
     - returns: Instance of NVActivityIndicatorAnimationBallPulseSync.
     */
    case BallPulseSync
    /**
     BallBeat.
     
     - returns: Instance of NVActivityIndicatorAnimationBallBeat.
     */
    case BallBeat
    /**
     LineScalePulseOut.
     
     - returns: Instance of NVActivityIndicatorAnimationLineScalePulseOut.
     */
    case LineScalePulseOut
    /**
     LineScalePulseOutRapid.
     
     - returns: Instance of NVActivityIndicatorAnimationLineScalePulseOutRapid.
     */
    case LineScalePulseOutRapid
    /**
     BallScaleRipple.
     
     - returns: Instance of NVActivityIndicatorAnimationBallScaleRipple.
     */
    case BallScaleRipple
    /**
     BallScaleRippleMultiple.
     
     - returns: Instance of NVActivityIndicatorAnimationBallScaleRippleMultiple.
     */
    case BallScaleRippleMultiple
    /**
     BallSpinFadeLoader.
     
     - returns: Instance of NVActivityIndicatorAnimationBallSpinFadeLoader.
     */
    case BallSpinFadeLoader
    /**
     LineSpinFadeLoader.
     
     - returns: Instance of NVActivityIndicatorAnimationLineSpinFadeLoader.
     */
    case LineSpinFadeLoader
    /**
     TriangleSkewSpin.
     
     - returns: Instance of NVActivityIndicatorAnimationTriangleSkewSpin.
     */
    case TriangleSkewSpin
    /**
     Pacman.
     
     - returns: Instance of NVActivityIndicatorAnimationPacman.
     */
    case Pacman
    /**
     BallGridBeat.
     
     - returns: Instance of NVActivityIndicatorAnimationBallGridBeat.
     */
    case BallGridBeat
    /**
     SemiCircleSpin.
     
     - returns: Instance of NVActivityIndicatorAnimationSemiCircleSpin.
     */
    case SemiCircleSpin
    /**
     BallRotateChase.
     
     - returns: Instance of NVActivityIndicatorAnimationBallRotateChase.
     */
    case BallRotateChase
    
    private func animation() -> NVActivityIndicatorAnimationDelegate {
        switch self {
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
        case .BallRotateChase:
            return NVActivityIndicatorAnimationBallRotateChase()
        }
    }
}

public class NVActivityIndicatorView: UIView {
    private static let DEFAULT_TYPE: NVActivityIndicatorType = .Pacman
    private static let DEFAULT_COLOR = UIColor.whiteColor()
    private static let DEFAULT_SIZE: CGSize = CGSize(width: 40, height: 40)
    
    /// Animation type, value of NVActivityIndicatorType enum.
    public var type: NVActivityIndicatorType
    
    /// Color of activity indicator view.
    public var color: UIColor
    
    /// Actual size of animation in view.
    public var size: CGSize
    
    /// Current status of animation, this is not used to start or stop animation.
    public var animating: Bool = false
    
    /// Specify whether activity indicator view should hide once stopped.
    public var hidesWhenStopped: Bool = true
    
    /**
     Create a activity indicator view with default type, color and size.\n
     This is used by storyboard to initiate the view.
     
     - Default type is pacman.\n
     - Default color is white.\n
     - Default size is 40.
     
     - parameter decoder:
     
     - returns: The activity indicator view.
     */
    required public init?(coder aDecoder: NSCoder) {
        self.type = NVActivityIndicatorView.DEFAULT_TYPE
        self.color = NVActivityIndicatorView.DEFAULT_COLOR
        self.size = NVActivityIndicatorView.DEFAULT_SIZE
        super.init(coder: aDecoder);
        super.backgroundColor = UIColor.clearColor()
    }
    
    /**
     Create a activity indicator view with specified type, color, size and size.
     
     - parameter frame: view's frame.
     - parameter type: animation type, value of NVActivityIndicatorType enum. Default type is pacman.
     - parameter color: color of activity indicator view. Default color is white.
     - parameter size: actual size of animation in view. Default size is 40.
     
     - returns: The activity indicator view.
     */
    public init(frame: CGRect, type: NVActivityIndicatorType = DEFAULT_TYPE, color: UIColor = DEFAULT_COLOR, size: CGSize = DEFAULT_SIZE) {
        self.type = type
        self.color = color
        self.size = size
        super.init(frame: frame)
    }
    
    /**
     Start animation.
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
     Stop animation.
     */
    public func stopAnimation() {
        self.layer.sublayers = nil
        self.animating = false
        if hidesWhenStopped && !hidden {
            hidden = true
        }
    }
    
    // MARK: Privates
    
    private func setUpAnimation() {
        let animation: protocol<NVActivityIndicatorAnimationDelegate> = self.type.animation()
        
        self.layer.sublayers = nil
        animation.setUpAnimationInLayer(self.layer, size: self.size, color: self.color)
    }
}
