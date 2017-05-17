//
//  UIConfirmationBackgroundView.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-01-18.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

@IBDesignable
class UIConfirmationBackgroundView: UIMaskedVisualEffectView {
    
    @IBInspectable var cornerRadius: CGFloat = 20.0
    
    override internal func getMaskPath(bounds: CGRect)->UIBezierPath {
        let resultPath: UIBezierPath = UIBezierPath(roundedPolygonPathWithRect: bounds, sides: 6, cornerRadius: cornerRadius)
        UIBezierPath.rotatePath(path: resultPath, theta: CGFloat.pi / 2.0)
        return resultPath
    }
}
