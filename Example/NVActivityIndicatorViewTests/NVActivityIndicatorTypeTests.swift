//
//  NVActivityIndicatorTypeTests.swift
//  NVActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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
            .audioEqualizer: NVActivityIndicatorAnimationAudioEqualizer.self,
            .circleStrokeSpin: NVActivityIndicatorAnimationCircleStrokeSpin.self
        ]

        enumClass.forEach { enumm, clazz in
            let enummClassString = String(describing: enumm.animation())
            let clazzString = String(describing: clazz)

            XCTAssertTrue(enummClassString.hasSuffix(clazzString))
        }
    }

    func testAllTypes() {
        XCTAssertEqual(NVActivityIndicatorType.allTypes.last, NVActivityIndicatorType.circleStrokeSpin)
    }
}
