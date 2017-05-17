//
//  DialogPromptViewController.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-02-07.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

class DialogPromptViewController: BlurPromptViewController {
    
    @IBOutlet weak var dialogPromptView: UIDialogBackgroundView!
    @IBOutlet weak var contentContainer: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dialogPromptView?.setupComponent()
    }
    
    override func fadeOutPrompt() {
        UIView.animate(withDuration: 0.3, animations: {
            self.dialogPromptView?.alpha = 0.0
            self.contentContainer?.alpha = 0.0
        }, completion: {
            (value: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    @IBAction func onButtonTouchUpInside(_ sender: Any) {
        fadeOutPrompt()
    }
}
