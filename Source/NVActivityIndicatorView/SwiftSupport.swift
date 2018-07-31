//
//  SwiftSupport.swift
//  NVActivityIndicatorView
//

import UIKit

enum TimingFunction {
    #if swift(>=4.2)
    static var `default`: CAMediaTimingFunctionName {
        return .default
    }
    #else
    static var `default`: String {
        return kCAMediaTimingFunctionDefault
    }
    #endif

    #if swift(>=4.2)
    static var linear: CAMediaTimingFunctionName {
        return .linear
    }
    #else
    static var linear: String {
        return kCAMediaTimingFunctionLinear
    }
    #endif

    #if swift(>=4.2)
    static var easeInEaseOut: CAMediaTimingFunctionName {
        return .easeInEaseOut
    }
    #else
    static var easeInEaseOut: String {
        return kCAMediaTimingFunctionEaseInEaseOut
    }
    #endif
}

enum FillMode {
    #if swift(>=4.2)
    static var forward: CAMediaTimingFillMode {
        return CAMediaTimingFillMode.forwards
    }
    #else
    static var forward: String {
        return kCAFillModeForwards
    }
    #endif
}
