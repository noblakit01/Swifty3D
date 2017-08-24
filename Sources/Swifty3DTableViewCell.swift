//
//  Swifty3DTableViewCell.swift
//  Swifty3dCell
//
//  Created by luan on 8/22/17.
//
//

import UIKit

open class Swifty3DTableViewCell: UITableViewCell {

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        startMoving()
        if let location = touches.first?.location(in: self) {
            moving(location)
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let location = touches.first?.location(in: self) {
            moving(location)
        }
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        stopMoving()
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        stopMoving()
    }
}
