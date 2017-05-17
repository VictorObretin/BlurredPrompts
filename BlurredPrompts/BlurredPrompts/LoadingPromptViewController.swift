//
//  LoadingPromptViewController.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-02-07.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

class LoadingPromptViewController: BlurPromptViewController {
    
    @IBOutlet weak var loadingPromptView: UILoadingBackgroundView!
    @IBOutlet weak var loadingAnimationView: UILoadingAnimationView!
    @IBOutlet weak var loadingPercentageLabel: UILabel!
    
    var timer: DispatchSourceTimer?
    var currentProgressValue: CGFloat = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingPromptView?.setupComponent()
    }

    override func viewDidAppear(_ animated: Bool) {
        let queue = DispatchQueue.main
        
        if (timer != nil) {
            timer?.cancel()
        }
        
        currentProgressValue = 0.0
        let percentageValue: Int = Int(currentProgressValue * 100.0)
        loadingPercentageLabel?.text = percentageValue.description + "%"
        
        if (loadingAnimationView != nil) {
            loadingAnimationView?.setProgress(newValue: 0)
        }
        
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.scheduleRepeating(deadline: .now(), interval: .milliseconds(100), leeway: .seconds(0))
        timer?.setEventHandler(handler: loopHandler)
        timer?.resume()
    }
    
    override func fadeOutPrompt() {
        if (timer != nil) {
            timer?.cancel()
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingPromptView?.alpha = 0.0
            self.loadingAnimationView?.alpha = 0.0
            self.loadingPercentageLabel?.alpha = 0.0
        }, completion: {
            (value: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    private func loopHandler() {
        currentProgressValue += 0.02
        
        if (currentProgressValue >= 1.0) {
            currentProgressValue = 1.0
            timer?.cancel()
        }
        
        if (loadingAnimationView != nil) {
            loadingAnimationView?.setProgress(newValue: currentProgressValue)
        }
        
        if (loadingPercentageLabel != nil) {
            let percentageValue: Int = Int(round(currentProgressValue * 100.0))
            loadingPercentageLabel?.text = percentageValue >= 100 ? "Done" : percentageValue.description + "%"
        }
    }
}
