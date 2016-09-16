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
 - Orbit:                   Orbit animation.
 - AudioEqualizer:          AudioEqualizer animation.
 */
public enum NVActivityIndicatorType: Int {
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
    /**
     Orbit.
     
     - returns: Instance of NVActivityIndicatorAnimationOrbit.
     */
    case Orbit
    /**
     AudioEqualizer.
     
     - returns: Instance of NVActivityIndicatorAnimationAudioEqualizer.
     */
    case AudioEqualizer
    
    static let allTypes = (Blank.rawValue ... AudioEqualizer.rawValue).map{ NVActivityIndicatorType(rawValue: $0)! }

    func animation() -> NVActivityIndicatorAnimationDelegate {
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
        case .Orbit:
            return NVActivityIndicatorAnimationOrbit()
        case .AudioEqualizer:
            return NVActivityIndicatorAnimationAudioEqualizer()
        }
    }
}

/// Activity indicator view with nice animations
public class NVActivityIndicatorView: UIView {
    /// Default type. Default value is .BallSpinFadeLoader.
    public static var DEFAULT_TYPE: NVActivityIndicatorType = .BallSpinFadeLoader
    
    /// Default color. Default value is UIColor.whiteColor().
    public static var DEFAULT_COLOR = UIColor.whiteColor()
    
    /// Default padding. Default value is 0.
    public static var DEFAULT_PADDING: CGFloat = 0
    
    /// Default size of activity indicator view in UI blocker. Default value is 60x60.
    public static var DEFAULT_BLOCKER_SIZE = CGSizeMake(60, 60)
    
    /// Default display time threshold to actually display UI blocker. Default value is 0 ms.
    public static var DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0
    
    /// Default minimum display time of UI blocker. Default value is 0 ms.
    public static var DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0

    /// Animation type.
    public var type: NVActivityIndicatorType = NVActivityIndicatorView.DEFAULT_TYPE

    @available(*, unavailable, message="This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var typeName: String {
        get {
            return self.getTypeName()
        }
        set {
            self.setTypeName_(newValue)
        }
    }

    /// Color of activity indicator view.
    @IBInspectable public var color: UIColor = NVActivityIndicatorView.DEFAULT_COLOR

    /// Padding of activity indicator view.
    @IBInspectable public var padding: CGFloat = NVActivityIndicatorView.DEFAULT_PADDING

    /// Current status of animation, read-only.
    public var animating: Bool {
        return _animating
    }
    private var _animating: Bool = false
    
    /**
     Returns an object initialized from data in a given unarchiver.
     self, initialized using the data in decoder.
     
     - parameter decoder: an unarchiver object.
     
     - returns: self, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
        self.hidden = true
    }
    
    /**
     Create a activity indicator view.
     
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter frame:   view's frame.
     - parameter type:    animation type.
     - parameter color:   color of activity indicator view.
     - parameter padding: padding of activity indicator view.
     
     - returns: The activity indicator view.
     */
    public init(frame: CGRect, type: NVActivityIndicatorType? = nil, color: UIColor? = nil, padding: CGFloat? = nil) {
        self.type = type ?? NVActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? NVActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? NVActivityIndicatorView.DEFAULT_PADDING
        super.init(frame: frame)
        self.hidden = true
    }
    
    // Fix issue #62
    // Intrinsic content size is used in autolayout
    // that causes mislayout when using with MBProgressHUD.
    /**
     Returns the natural size for the receiving view, considering only properties of the view itself.
     
     A size indicating the natural size for the receiving view based on its intrinsic properties.
     
     - returns: A size indicating the natural size for the receiving view based on its intrinsic properties.
     */
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
    
    /**
     Start animating.
     */
    public func startAnimating() {
        self.hidden = false
        self._animating = true
        self.layer.speed = 1
        setUpAnimation()
    }
    
    /**
     Stop animating.
     */
    public func stopAnimating() {
        self.hidden = true
        self._animating = false
        self.layer.sublayers?.removeAll()
    }
    
    // MARK: Internal
    
    func setTypeName_(typeName: String) {
        for item in NVActivityIndicatorType.allTypes {
            if String(item).caseInsensitiveCompare(typeName) == NSComparisonResult.OrderedSame {
                self.type = item
                break
            }
        }
    }
    
    func getTypeName() -> String {
        return String(self.type)
    }
    
    // MARK: Privates
    
    private func setUpAnimation() {
        let animation: protocol<NVActivityIndicatorAnimationDelegate> = self.type.animation()
        var animationRect = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(padding, padding, padding, padding))
        let minEdge = min(animationRect.width, animationRect.height)
        
        self.layer.sublayers = nil
        animationRect.size = CGSizeMake(minEdge, minEdge)
        animation.setUpAnimationInLayer(self.layer, size: animationRect.size, color: self.color)
    }
    
    // MARK: Deprecated
    
    /// Specify whether activity indicator view should hide once stopped.
    @available(*, deprecated=2.11)
    @IBInspectable public var hidesWhenStopped: Bool = true
    
    /**
     Start animating.
     */
    @available(*, deprecated=2.11, renamed="startAnimating()")
    public func startAnimation() {
        self.startAnimating()
    }
    
    /**
     Stop animating.
     */
    @available(*, deprecated=2.11, renamed="stopAnimating()")
    public func stopAnimation() {
        self.stopAnimating()
    }
}
