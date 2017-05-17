//
//  ConfirmationPromptViewController.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2017-02-07.
//  Copyright © 2017 Victor Obretin. All rights reserved.
//

import UIKit

class ConfirmationPromptViewController: BlurPromptViewController {
    
    @IBOutlet weak var confirmationPromptView: UIConfirmationBackgroundView!
    @IBOutlet weak var emptyHeartImage: UIImageView!
    @IBOutlet weak var redHeartImage: UIImageView!
    @IBOutlet weak var labelContainer: UIView!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redHeartImage.alpha = 0
        redHeartImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmationPromptView?.setupComponent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animationOptions: UIViewAnimationOptions = UIViewAnimationOptions()
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 2.0, options: animationOptions, animations: {
            self.redHeartImage?.alpha = 1.0
            self.redHeartImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    override func fadeOutPrompt() {
        UIView.animate(withDuration: 0.3, animations: {
            self.confirmationPromptView?.alpha = 0.0
            self.emptyHeartImage?.alpha = 0.0
            self.redHeartImage?.alpha = 0.0
            self.labelContainer?.alpha = 0.0
        }, completion: {
            (value: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
}
