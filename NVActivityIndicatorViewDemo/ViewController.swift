//
//  ViewController.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
        
        let activityTypes: [NVActivityIndicatorType] = [
            .BallPulse,
            .BallGridPulse,
            .BallClipRotate,
            .BallClipRotatePulse,
            .SquareSpin,
            .BallClipRotateMultiple,
            .BallPulseRise,
            .BallRotate,
            .CubeTransition,
            .BallZigZag,
            .BallZigZagDeflect,
            .BallTrianglePath,
            .BallScale,
            .LineScale,
            .LineScaleParty,
            .BallScaleMultiple,
            .BallPulseSync,
            .BallBeat,
            .LineScalePulseOut,
            .LineScalePulseOutRapid,
            .BallScaleRipple,
            .BallScaleRippleMultiple,
            .BallSpinFadeLoader,
            .LineSpinFadeLoader,
            .TriangleSkewSpin,
            .Pacman,
            .BallGridBeat,
            .BallCirclePath]
        let cols = 4
        let rows = 7
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))
        
        for var i = 0; i < activityTypes.count; i++ {
            let x = i % cols * cellWidth
            let y = i / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                type: activityTypes[i])
            
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimation()
        }
    }
    
}

