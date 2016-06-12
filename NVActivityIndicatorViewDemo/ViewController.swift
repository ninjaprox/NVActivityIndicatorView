//
//  ViewController.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
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
            .SemiCircleSpin,
            .BallRotateChase,
            .Orbit
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
        
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))
        
        for i in 0 ..< activityTypes.count {
            let x = i % cols * cellWidth
            let y = i / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                type: activityTypes[i])
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String(i + 1)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.whiteColor()
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimation()
            
            let button:UIButton = UIButton(frame: frame)
            button.tag = i
            button.addTarget(self,
                action: #selector(buttonTapped(_:)),
                forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func buttonTapped(sender: UIButton) {
        startActivityAnimating("Loading...", type: activityTypes[sender.tag])
        performSelector(#selector(delayedStopActivity),
            withObject: nil,
            afterDelay: 2.5)
    }
    
    func delayedStopActivity() {
        stopActivityAnimating()
    }
    
}

