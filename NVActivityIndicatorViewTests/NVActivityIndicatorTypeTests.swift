//
//  NVActivityIndicatorTypeTests.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 9/3/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import XCTest
@testable import NVActivityIndicatorView

class NVActivityIndicatorTypeTests: XCTestCase {
    
    func testAnimation() {
        let enumClass: [NVActivityIndicatorType: NVActivityIndicatorAnimationDelegate.Type] = [
            .Blank: NVActivityIndicatorAnimationBlank.self,
            .BallPulse: NVActivityIndicatorAnimationBallPulse.self,
            .BallGridPulse: NVActivityIndicatorAnimationBallGridPulse.self,
            .BallClipRotate: NVActivityIndicatorAnimationBallClipRotate.self,
            .SquareSpin: NVActivityIndicatorAnimationSquareSpin.self,
            .BallClipRotatePulse: NVActivityIndicatorAnimationBallClipRotatePulse.self,
            .BallClipRotateMultiple: NVActivityIndicatorAnimationBallClipRotateMultiple.self,
            .BallPulseRise: NVActivityIndicatorAnimationBallPulseRise.self,
            .BallRotate: NVActivityIndicatorAnimationBallRotate.self,
            .CubeTransition: NVActivityIndicatorAnimationCubeTransition.self,
            .BallZigZag: NVActivityIndicatorAnimationBallZigZag.self,
            .BallZigZagDeflect: NVActivityIndicatorAnimationBallZigZagDeflect.self,
            .BallTrianglePath: NVActivityIndicatorAnimationBallTrianglePath.self,
            .BallScale: NVActivityIndicatorAnimationBallScale.self,
            .LineScale: NVActivityIndicatorAnimationLineScale.self,
            .LineScaleParty: NVActivityIndicatorAnimationLineScaleParty.self,
            .BallScaleMultiple: NVActivityIndicatorAnimationBallScaleMultiple.self,
            .BallPulseSync: NVActivityIndicatorAnimationBallPulseSync.self,
            .BallBeat: NVActivityIndicatorAnimationBallBeat.self,
            .LineScalePulseOut: NVActivityIndicatorAnimationLineScalePulseOut.self,
            .LineScalePulseOutRapid: NVActivityIndicatorAnimationLineScalePulseOutRapid.self,
            .BallScaleRipple: NVActivityIndicatorAnimationBallScaleRipple.self,
            .BallScaleRippleMultiple: NVActivityIndicatorAnimationBallScaleRippleMultiple.self,
            .BallSpinFadeLoader: NVActivityIndicatorAnimationBallSpinFadeLoader.self,
            .LineSpinFadeLoader: NVActivityIndicatorAnimationLineSpinFadeLoader.self,
            .TriangleSkewSpin: NVActivityIndicatorAnimationTriangleSkewSpin.self,
            .Pacman: NVActivityIndicatorAnimationPacman.self,
            .BallGridBeat: NVActivityIndicatorAnimationBallGridBeat.self,
            .SemiCircleSpin: NVActivityIndicatorAnimationSemiCircleSpin.self,
            .BallRotateChase: NVActivityIndicatorAnimationBallRotateChase.self,
            .Orbit: NVActivityIndicatorAnimationOrbit.self,
            .AudioEqualizer: NVActivityIndicatorAnimationAudioEqualizer.self
        ]
        
        enumClass.forEach { (enumm, clazz) in
            let enummClassString = String(enumm.animation())
            let clazzString = String(clazz)
            
            XCTAssertTrue(enummClassString.hasSuffix(clazzString))
        }
    }
    
    func testAllTypes() {
        XCTAssertEqual(NVActivityIndicatorType.allTypes.last, NVActivityIndicatorType.AudioEqualizer)
    }
}
