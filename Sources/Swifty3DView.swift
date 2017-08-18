//
//  Swifty3DView.swift
//  
//
//  Created by Minh Luan Tran on 8/16/17.
//
//

import Foundation
import UIKit

public class Swifty3DView: UIView {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        start3DAnimation()
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let location = touches.first?.location(in: self) {
            moving(location)
        }
    }
    
    var shadowFactor: CGFloat {
        get {
            return 10.0
        }
    }
    
    var animationDuration: CFTimeInterval {
        return 0.4
    }
    
    let highlightedScale: CGFloat = 1.22
    
    let rotateXFactor: CGFloat = 12
    
    let rotateYFactor: CGFloat = 14
    
    let rotateZFactor: CGFloat = 9
    
    let maxTranslationX: CGFloat = 3.5
    
    let maxTranslationY: CGFloat = 2.5

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
    
    func moving(_ point: CGPoint){
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
}
