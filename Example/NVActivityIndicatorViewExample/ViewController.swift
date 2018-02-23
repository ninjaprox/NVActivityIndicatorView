//
//  ViewController.swift
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

import UIKit
import Foundation
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)

        let cols = 4
        let rows = 9
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))

        for (index, type) in NVActivityIndicatorType.allStandardTypes.enumerated() {
            let x = (index - 1) % cols * cellWidth
            let y = (index - 1) / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                                type: type)
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String(index)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.white
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            if case NVActivityIndicatorType.orbit = type {
                activityIndicatorView.padding = 0
            }
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimating()
            
            let button: UIButton = UIButton(frame: frame)
            button.tag = index
            button.addTarget(self,
                             action: #selector(buttonTapped(_:)),
                             for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
        
        // Add custom animation
        let x = (NVActivityIndicatorType.allStandardTypes.count - 1) % cols * cellWidth
        let y = (NVActivityIndicatorType.allStandardTypes.count - 1) / cols * cellHeight
        let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                            type: NVActivityIndicatorType.customType(NVActivityIndicatorAnimationChrono()))
        let animationTypeLabel = UILabel(frame: frame)
        
        animationTypeLabel.text = "Custom"
        animationTypeLabel.sizeToFit()
        animationTypeLabel.textColor = UIColor.white
        animationTypeLabel.frame.origin.x += 5
        animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
        
        activityIndicatorView.padding = 20
        self.view.addSubview(activityIndicatorView)
        self.view.addSubview(animationTypeLabel)
        activityIndicatorView.startAnimating()
        
        let button: UIButton = UIButton(frame: frame)
        button.tag = NVActivityIndicatorType.allStandardTypes.count
        button.addTarget(self,
                         action: #selector(buttonTapped(_:)),
                         for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let size = CGSize(width: 30, height: 30)

        if sender.tag < NVActivityIndicatorType.allStandardTypes.count {
            // Standard animation
            startAnimating(size, message: "Loading...", type: NVActivityIndicatorType.allStandardTypes[sender.tag])
        } else {
            // Custom animation
            startAnimating(size, message: "Loading...", type: NVActivityIndicatorType.customType(NVActivityIndicatorAnimationChrono()))
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
        }
    }
}
