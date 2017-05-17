//
//  UIDialogBackgroundView.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-01-18.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

@IBDesignable
class UIDialogBackgroundView: UIMaskedVisualEffectView {
    
    @IBInspectable var cornerRadius: CGFloat = 10.0
    
    override internal func getMaskPath(bounds: CGRect)->UIBezierPath {
        let resultPath: UIBezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
        return resultPath
    }
}
