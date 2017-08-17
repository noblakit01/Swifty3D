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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        start3DAnimation()
    }
    
    var shadowFactor: CGFloat {
        get {
            return 1.1
        }
    }
    
    var animationDuration: CFTimeInterval {
        return 0.4
    }
    
    func start3DAnimation() {
        let targetShadowOffset = CGSize(width: 0.0, height: bounds.size.height / shadowFactor)
        layer.removeAllAnimations()
        CATransaction.begin()
        CATransaction.setCompletionBlock({ () -> Void in
            self.layer.shadowOffset = targetShadowOffset
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
