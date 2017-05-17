//
//  UILoadingBackgroundView.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-01-15.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

@IBDesignable
class UILoadingBackgroundView: UIMaskedVisualEffectView {
    
    override internal func getMaskPath(bounds: CGRect)->UIBezierPath {
        let resultPath: UIBezierPath = UIBezierPath(ovalIn: bounds)
        return resultPath
    }
}
