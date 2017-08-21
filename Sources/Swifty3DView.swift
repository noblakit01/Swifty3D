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
        
        startMoving()
        if let location = touches.first?.location(in: self) {
            moving(location)
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let location = touches.first?.location(in: self) {
            moving(location)
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        stopMoving()
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        stopMoving()
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
}
