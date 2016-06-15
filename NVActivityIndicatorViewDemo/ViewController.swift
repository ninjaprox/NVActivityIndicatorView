//
//  ViewController.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/21/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
        
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))
        
        (NVActivityIndicatorType.BallPulse.rawValue ... NVActivityIndicatorType.AudioEqualizer.rawValue).forEach {
            let x = ($0 - 1) % cols * cellWidth
            let y = ($0 - 1) / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                type: NVActivityIndicatorType(rawValue: $0)!)
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String($0)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.whiteColor()
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            if ($0 == NVActivityIndicatorType.Orbit.rawValue) {
                activityIndicatorView.padding = 0
            }
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimation()
            
            let button:UIButton = UIButton(frame: frame)
            button.tag = $0
            button.addTarget(self,
                action: #selector(buttonTapped(_:)),
                forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func buttonTapped(sender: UIButton) {
        let size = CGSize(width: 30, height:30)

        startActivityAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: sender.tag)!)
        performSelector(#selector(delayedStopActivity),
            withObject: nil,
            afterDelay: 2.5)
    }
    
    func delayedStopActivity() {
        stopActivityAnimating()
    }
}

