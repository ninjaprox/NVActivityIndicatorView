//
//  NVActivityIndicator.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Tulakshana on 4/15/16.
//  Copyright © 2016 Nguyen Vinh. All rights reserved.
//

import UIKit

public class NVActivityIndicator : UIView {
    public static func startActivity (inView:UIView, indicatorType:NVActivityIndicatorType){
        let activityIndicator:NVActivityIndicator = NVActivityIndicator(frame: inView.bounds)
        
        let width = inView.frame.size.width/3
        let height = width
        
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRectMake(0, 0, width, height),
            type: indicatorType)
        activityIndicatorView.center = activityIndicator.center
        activityIndicatorView.startAnimation()
        activityIndicator.addSubview(activityIndicatorView)
        
        inView.addSubview(activityIndicator)
        
    }
    
    public static func stopActivity (inView:UIView){
        for case let activityIndicator as NVActivityIndicator in inView.subviews {
            activityIndicator.removeFromSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

    
}
