//
//  UIMaskedView.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-01-15.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

@IBDesignable
class UIMaskedVisualEffectView: UIVisualEffectView {
    
    var containerMaskView: UIView?
    var maskShape: CAShapeLayer?
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupComponent(inInterfaceBuilder: true)
    }
    
    internal func setupComponent(inInterfaceBuilder: Bool = false) {
        setMask(inInterfaceBuilder: inInterfaceBuilder)
    }
    
    internal func setMask(inInterfaceBuilder: Bool = false) {
        if (containerMaskView == nil) {
            
            containerMaskView = UIView()
            containerMaskView?.frame = self.bounds
            containerMaskView?.backgroundColor = UIColor.black
            
            maskShape = CAShapeLayer()
            maskShape?.fillRule = kCAFillRuleEvenOdd
            maskShape?.fillColor = UIColor.black.cgColor
            maskShape?.frame = containerMaskView!.bounds
            maskShape?.path = getMaskPath(bounds: containerMaskView!.bounds).cgPath
            
            containerMaskView?.layer.mask = maskShape
        }
        
        if (inInterfaceBuilder) {
            self.layer.mask = maskShape
        }
        else {
            self.mask = containerMaskView
        }
    }
    
    internal func getMaskPath(bounds: CGRect)->UIBezierPath {
        return UIBezierPath(rect: bounds)
    }
}
