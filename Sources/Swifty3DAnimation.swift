//
//  Swifty3DAnimation.swift
//  Swifty3dCell
//
//  Created by luan on 8/21/17.
//
//

import UIKit

protocol Swifty3DAnimation: class {
    var shadowFactor: CGFloat {get}
    
    var animationDuration: CFTimeInterval {get}
    
    var highlightedScale: CGFloat {get}
    
    var rotateXFactor: CGFloat {get}
    
    var rotateYFactor: CGFloat {get}
    
    var rotateZFactor: CGFloat {get}
    
    var maxTranslationX: CGFloat {get}
    
    var maxTranslationY: CGFloat {get}
}

extension Swifty3DAnimation {
    var shadowFactor: CGFloat {
        get {
            return 10.0
        }
    }
    
    var animationDuration: CFTimeInterval {
        return 0.4
    }
    
    var highlightedScale: CGFloat {
        return 1.0
    }
    
    var rotateXFactor: CGFloat {
        return 12
    }
    
    var rotateYFactor: CGFloat {
        return 14
    }
    
    var rotateZFactor: CGFloat {
        return 9
    }
    
    var maxTranslationX: CGFloat {
        return 3.5
    }
    
    var maxTranslationY: CGFloat {
        return 2.5
    }
}
