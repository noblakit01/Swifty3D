//
//  UIView.swift
//  Swifty3dCell
//
//  Created by luan on 8/21/17.
//
//

import UIKit

extension UIView: Swifty3DAnimation {
    
    func startMoving() {
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
    
    func moving(_ point: CGPoint) {
        let offsetX = point.x / bounds.size.width
        let offsetY = point.y / bounds.size.height
        let dx = point.x - bounds.size.width / 2
        let dy = point.y - bounds.size.height / 2
        let xRotation = (dy - offsetY) * (rotateXFactor / bounds.size.width)
        let yRotation = (offsetX - dx) * (rotateYFactor / bounds.size.width)
        let zRotation = (xRotation + yRotation) / rotateZFactor
        
        let xTranslation = (-2 * point.x / bounds.size.width) * maxTranslationX
        let yTranslation = (-2 * point.y / bounds.size.height) * maxTranslationY
        
        let xRotateTransform = CATransform3DMakeRotation(xRotation.degreesToRadians, 1, 0, 0)
        let yRotateTransform = CATransform3DMakeRotation(yRotation.degreesToRadians, 0, 1, 0)
        let zRotateTransform = CATransform3DMakeRotation(zRotation.degreesToRadians, 0, 0, 1)
        
        let combinedRotateTransformXY = CATransform3DConcat(xRotateTransform, yRotateTransform)
        let combinedRotateTransformZ = CATransform3DConcat(combinedRotateTransformXY, zRotateTransform)
        let translationTransform = CATransform3DMakeTranslation(-xTranslation, yTranslation, 0.0)
        let combinedRotateTranslateTransform = CATransform3DConcat(combinedRotateTransformZ, translationTransform)
        let targetScaleTransform = CATransform3DMakeScale(highlightedScale, highlightedScale, highlightedScale)
        let combinedTransform = CATransform3DConcat(combinedRotateTranslateTransform, targetScaleTransform)
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.layer.transform = combinedTransform
        }, completion: nil)
        UIView.animate(withDuration: 0.16, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            
        }, completion: nil)
    }
    
    func stopMoving() {
        let targetShadowOffset = CGSize(width: 0.0, height: shadowFactor / 3)
        let targetScaleTransform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.layer.transform = targetScaleTransform
            self.layer.shadowOffset = targetShadowOffset
        }
        let shadowOffsetAnimation = CABasicAnimation(keyPath: "shadowOffset")
        shadowOffsetAnimation.toValue = NSValue(cgSize: targetShadowOffset)
        shadowOffsetAnimation.duration = animationDuration
        shadowOffsetAnimation.fillMode = kCAFillModeForwards
        shadowOffsetAnimation.isRemovedOnCompletion = false
        shadowOffsetAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        layer.add(shadowOffsetAnimation, forKey: "shadowOffset")
        
        let shadowOpacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        shadowOpacityAnimation.toValue = 0.0
        shadowOpacityAnimation.duration = animationDuration
        shadowOpacityAnimation.isRemovedOnCompletion = false
        shadowOpacityAnimation.fillMode = kCAFillModeForwards
        shadowOpacityAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        layer.add(shadowOpacityAnimation, forKey: "shadowOpacityAnimation")
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        scaleAnimation.toValue = NSValue(caTransform3D: targetScaleTransform)
        scaleAnimation.duration = animationDuration
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = kCAFillModeForwards
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: "easeOut")
        layer.add(scaleAnimation, forKey: "scaleAnimation")
        
        CATransaction.commit()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform.identity
            
        }, completion:nil)
    }
    
}
