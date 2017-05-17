//
//  BlurPromptViewController.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-02-07.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

class BlurPromptViewController: UIViewController {
    
    private var _statusBarHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.clear
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        fadeOutPrompt()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        fadeOutPrompt()
    }
    
    func fadeOutPrompt() {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (self.presentingViewController != nil) {
            let parentViewController: MainViewController? = self.presentingViewController! as? MainViewController
            
            if (parentViewController != nil) {
                parentViewController?.showButtons(show: true)
            }
        }
    }
}
