//
//  UILoadingAnimationView.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-02-09.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

@IBDesignable
class UILoadingAnimationView: UIView {
    
    @IBInspectable var progressLineWidth: CGFloat = 2.0
    @IBInspectable var progressLineColor: UIColor = UIColor.white
    @IBInspectable var trackLineWidth: CGFloat = 2.0
    @IBInspectable var trackLineColor: UIColor = UIColor.black
    @IBInspectable var animationMultiplier: CGFloat = 1.0
    @IBInspectable var progress: CGFloat = 0.001
    
    private var _rotationLayer: CALayer?
    private var _progressLine: CACircularProgressLine?
    private var _trackLine: CACircularProgressLine?
    private var _rotationAnimation: CABasicAnimation?
    private var _currentProgressValue: CGFloat = 0.001
    private var _displayLink: CADisplayLink?
    
    private let kMinPogressValue: CGFloat = 0.001
    private let kStepPogressValue: CGFloat = 0.001
    
    func setProgress(newValue: CGFloat) {
        _currentProgressValue = max(newValue, kMinPogressValue)
        drawProgressLine(progress: _currentProgressValue)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        _currentProgressValue = max(progress, kMinPogressValue)
        setupComponent()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupComponent(inInterfaceBuilder: true)
        drawProgressLine(progress: max(progress, kMinPogressValue))
    }
    
    private func setupComponent(inInterfaceBuilder: Bool = false) {
        drawTrackLine()
        createLayers()
        startRotationAnimation()
        drawProgressLine(progress: _currentProgressValue)
    }
    
    private func drawTrackLine() {
        if (_trackLine == nil) {
            _trackLine = CACircularProgressLine()
            self.layer.addSublayer(_trackLine!)
        }
        
        let lineBounds = self.bounds
        let adjustedBounds = lineBounds.insetBy(dx: (progressLineWidth - trackLineWidth) / 2.0, dy: (progressLineWidth - trackLineWidth) / 2.0)
        
        _trackLine?.frame = adjustedBounds
        _trackLine?.lineWidth = trackLineWidth
        _trackLine?.strokeEnd = 1.0
        _trackLine?.lineColor = trackLineColor
        _trackLine?.drawPath()
    }
    
    private func createLayers() {
        if (_rotationLayer == nil) {
            _rotationLayer = CALayer()
            self.layer.addSublayer(_rotationLayer!)
        }
        
        if (_progressLine == nil) {
            _progressLine = CACircularProgressLine()
            _progressLine?.lineCap = kCALineCapRound
            _rotationLayer?.addSublayer(_progressLine!)
        }
        
        _rotationLayer?.frame = self.bounds
        
        _progressLine?.frame = _rotationLayer!.bounds
    }
    
    private func drawProgressLine(progress: CGFloat) {
        _progressLine?.lineWidth = progressLineWidth
        _progressLine?.strokeEnd = progress
        _progressLine?.lineColor = progressLineColor
        _progressLine?.drawPath()
    }
    
    private func startRotationAnimation() {
        if (_rotationAnimation == nil) {
            _rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            
            _rotationAnimation?.fromValue = 0
            _rotationAnimation?.toValue =  CGFloat.pi * 2.0
            _rotationAnimation?.duration = 10.0 * Double(animationMultiplier)
            _rotationAnimation?.repeatCount = Float.infinity
            
            _progressLine?.add(_rotationAnimation!, forKey: "com.myapplication.rotationanimationkey")
        }
    }
}
