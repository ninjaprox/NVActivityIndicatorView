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
            .blank: NVActivityIndicatorAnimationBlank.self,
            .ballPulse: NVActivityIndicatorAnimationBallPulse.self,
            .ballGridPulse: NVActivityIndicatorAnimationBallGridPulse.self,
            .ballClipRotate: NVActivityIndicatorAnimationBallClipRotate.self,
            .squareSpin: NVActivityIndicatorAnimationSquareSpin.self,
            .ballClipRotatePulse: NVActivityIndicatorAnimationBallClipRotatePulse.self,
            .ballClipRotateMultiple: NVActivityIndicatorAnimationBallClipRotateMultiple.self,
            .ballPulseRise: NVActivityIndicatorAnimationBallPulseRise.self,
            .ballRotate: NVActivityIndicatorAnimationBallRotate.self,
            .cubeTransition: NVActivityIndicatorAnimationCubeTransition.self,
            .ballZigZag: NVActivityIndicatorAnimationBallZigZag.self,
            .ballZigZagDeflect: NVActivityIndicatorAnimationBallZigZagDeflect.self,
            .ballTrianglePath: NVActivityIndicatorAnimationBallTrianglePath.self,
            .ballScale: NVActivityIndicatorAnimationBallScale.self,
            .lineScale: NVActivityIndicatorAnimationLineScale.self,
            .lineScaleParty: NVActivityIndicatorAnimationLineScaleParty.self,
            .ballScaleMultiple: NVActivityIndicatorAnimationBallScaleMultiple.self,
            .ballPulseSync: NVActivityIndicatorAnimationBallPulseSync.self,
            .ballBeat: NVActivityIndicatorAnimationBallBeat.self,
            .lineScalePulseOut: NVActivityIndicatorAnimationLineScalePulseOut.self,
            .lineScalePulseOutRapid: NVActivityIndicatorAnimationLineScalePulseOutRapid.self,
            .ballScaleRipple: NVActivityIndicatorAnimationBallScaleRipple.self,
            .ballScaleRippleMultiple: NVActivityIndicatorAnimationBallScaleRippleMultiple.self,
            .ballSpinFadeLoader: NVActivityIndicatorAnimationBallSpinFadeLoader.self,
            .lineSpinFadeLoader: NVActivityIndicatorAnimationLineSpinFadeLoader.self,
            .triangleSkewSpin: NVActivityIndicatorAnimationTriangleSkewSpin.self,
            .pacman: NVActivityIndicatorAnimationPacman.self,
            .ballGridBeat: NVActivityIndicatorAnimationBallGridBeat.self,
            .semiCircleSpin: NVActivityIndicatorAnimationSemiCircleSpin.self,
            .ballRotateChase: NVActivityIndicatorAnimationBallRotateChase.self,
            .orbit: NVActivityIndicatorAnimationOrbit.self,
            .audioEqualizer: NVActivityIndicatorAnimationAudioEqualizer.self
        ]
        
        enumClass.forEach { (enumm, clazz) in
            let enummClassString = String(describing: enumm.animation())
            let clazzString = String(describing: clazz)
            
            XCTAssertTrue(enummClassString.hasSuffix(clazzString))
        }
    }
    
    func testAllTypes() {
        XCTAssertEqual(NVActivityIndicatorType.allTypes.last, NVActivityIndicatorType.audioEqualizer)
    }
}
