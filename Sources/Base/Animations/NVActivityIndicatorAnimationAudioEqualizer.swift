//
//  NVActivityIndicatorAnimationAudioEqualizer.swift
//  NVActivityIndicatorView
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

#if canImport(UIKit)
import UIKit

class NVActivityIndicatorAnimationAudioEqualizer: NVActivityIndicatorAnimationDelegate {

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - lineSize * 7) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: [CFTimeInterval] = [4.3, 2.5, 1.7, 3.1]
        let values = [0, 0.7, 0.4, 0.05, 0.95, 0.3, 0.9, 0.4, 0.15, 0.18, 0.75, 0.01]

        // Draw lines
        for i in 0 ..< 4 {
            let animation = CAKeyframeAnimation()

            animation.keyPath = "path"
            animation.isAdditive = true
            animation.values = []

            for j in 0 ..< values.count {
                let heightFactor = values[j]
                let height = size.height * CGFloat(heightFactor)
                let point = CGPoint(x: 0, y: size.height - height)
                let path = UIBezierPath(rect: CGRect(origin: point, size: CGSize(width: lineSize, height: height)))

                animation.values?.append(path.cgPath)
            }
            animation.duration = duration[i]
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            let line = NVActivityIndicatorShape.line.layerWith(size: CGSize(width: lineSize, height: size.height), color: color)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                               y: y,
                               width: lineSize,
                               height: size.height)

            line.frame = frame
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
}
#endif
