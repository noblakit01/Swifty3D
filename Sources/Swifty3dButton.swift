//
//  Swifty3dButton.swift
//  Swifty3dCell
//
//  Created by Minh Luan Tran on 10/4/17.
//
//

import UIKit

class Swifty3dButton: UIButton {

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
}
