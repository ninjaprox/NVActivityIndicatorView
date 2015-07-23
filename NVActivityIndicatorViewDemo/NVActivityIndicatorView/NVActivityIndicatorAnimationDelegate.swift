//
//  NVActivityIndicatorDelegate.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

protocol NVActivityIndicatorAnimationDelegate {
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor)
}
