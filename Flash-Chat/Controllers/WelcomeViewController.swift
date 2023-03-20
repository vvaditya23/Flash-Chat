//
//  WelcomeViewController.swift
//  Flash-Chat
//
//  Created by ヴィヤヴャハレ・アディティア on 18/03/23.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ///loop used to give text animation on launch of app, this functionaloity is being handled by the pod now.
        /*
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }*/
        
        titleLabel.text = "⚡️FlashChat";    //assign text for animation at launch
    }
}
