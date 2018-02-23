//
//  NVActivityIndicatorAnimationChrono.swift
//  NVActivityIndicatorView
//
// Custom Animation based on images.
//

import UIKit
import NVActivityIndicatorView

class NVActivityIndicatorAnimationChrono: NVActivityIndicatorAnimationDelegate {

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        
        let duration: CFTimeInterval = 4
        let beginTime = CACurrentMediaTime()
        
        // Opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = duration / 18
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 1
        
        // Animation
        let animation = CAAnimationGroup()
        animation.animations = [opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        for index in 0...17 {
            let imageLayer = CALayer()
            imageLayer.contents = UIImage(named: "Chrono_animation" + String(index + 1))?.withRenderingMode(.alwaysTemplate).cgImage
            let coloredlayer = CALayer()
            coloredlayer.frame = CGRect(x: x, y: y, width: size.width, height: size.height)
            imageLayer.frame = coloredlayer.bounds
            coloredlayer.opacity = 0
            coloredlayer.mask = imageLayer
            coloredlayer.backgroundColor = color.cgColor
            
            animation.beginTime = beginTime + TimeInterval(index) * (duration / 18)
            coloredlayer.add(animation, forKey: "animation")
            
            layer.addSublayer(coloredlayer)
        }
    }
}
