//
//  MainViewController.swift
//  BlurredPrompts
//
//  Created by Victor Obretin on 2016-12-18.
//  Copyright © 2016 Victor Obretin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionLogo: UIImageView!
    @IBOutlet weak var loadingPromptButton: UIButton!
    @IBOutlet weak var confirmationPromptButton: UIButton!
    @IBOutlet weak var notificationPromptButton: UIButton!
    @IBOutlet weak var closeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        closeImage.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent //or default
    }
    
    @IBAction func onLoadingButtonTouchUpInside(_ sender: Any) {
        showButtons(show: false)
    }
    
    @IBAction func onConfirmationButtonTouchUpInside(_ sender: Any) {
        showButtons(show: false)
    }
    
    @IBAction func onNotificationButtonTouchUpInside(_ sender: Any) {
        showButtons(show: false)
    }
    
    func showButtons(show: Bool) {
        collectionLogo.isHidden = !show
        
        loadingPromptButton.isHidden = !show
        confirmationPromptButton.isHidden = !show
        notificationPromptButton.isHidden = !show
        
        closeImage.isHidden = show
    }
}
