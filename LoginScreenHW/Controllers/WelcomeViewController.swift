//
//  LoggedInViewController.swift
//  LoginScreenHW
//
//  Created by Никита Журавлев on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    var userLoginName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text = "Hello, " + userLoginName
    }
    
    @IBAction func goBackBtn() {
        dismiss(animated: true)
    }
    
}
