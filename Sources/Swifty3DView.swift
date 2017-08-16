//
//  Swifty3DView.swift
//  
//
//  Created by Minh Luan Tran on 8/16/17.
//
//

import Foundation
import UIKit

class Swifty3DView: UIView {
    
    var shadowFactor: Float {
        get {
            return 1.1
        }
    }
    
    func start3DAnimation() {
        
        let targetShadowOffset = CGSize(width: 0.0, height: bounds.size.height / shadowFactor)
        layer.removeAllAnimations()
        CATransaction.begin()
        CATransaction.setCompletionBlock({ () -> Void in
            layer.shadowOffset = targetShadowOffset
        })
        let shadowOffsetAnimation = CABasicAnimation(keyPath: "shadowOffset")
        shadowOffsetAnimation.toValue = NSValue(cgSize: targetShadowOffset)
        shadowOffsetAnimation.duration = animationDuration
        shadowOffsetAnimation.isRemovedOnCompletion = false
        shadowOffsetAnimation.fillMode = kCAFillModeForwards
        shadowOffsetAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        layer.add(shadowOffsetAnimation, forKey: "shadowOffset")
        CATransaction.commit()
        let shadowOpacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        shadowOpacityAnimation.toValue = 0.6
        shadowOpacityAnimation.duration = animationDuration
        shadowOpacityAnimation.isRemovedOnCompletion = false
        shadowOpacityAnimation.fillMode = kCAFillModeForwards
        shadowOpacityAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        layer.add(shadowOpacityAnimation, forKey: "shadowOpacityAnimation")
        CATransaction.commit()
    }
}
