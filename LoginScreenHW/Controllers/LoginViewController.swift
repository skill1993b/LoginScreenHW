//
//  LoginViewController.swift
//  LoginScreenHW
//
//  Created by Никита Журавлев on 25.05.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var userLoginTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotNameBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
// MARK: - Main variables and functions

    var userLogin = "", userPassword = ""
    
    let defaultLogin = "User", defaultPassword = "Password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotNameBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotNameBtn.titleLabel?.numberOfLines = 1
        forgotNameBtn.titleLabel?.minimumScaleFactor = 0.1
        
        forgotPasswordBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotPasswordBtn.titleLabel?.numberOfLines = 1
        forgotPasswordBtn.titleLabel?.minimumScaleFactor = 0.1
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedVC = segue.destination as? WelcomeViewController else { return }
        loggedVC.userLoginName = userLogin
    }

    @IBAction func loginBtnTappedFunc(_ sender: Any) {
        guard let login = userLoginTF.text, let password = userPasswordTF.text else { return }
        if login == defaultLogin && password == defaultPassword {
            userLogin = login
            userPassword = password
        } else {
            let alert = UIAlertController(title: "Ooops", message: "Your inserted data is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Understand", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        self.view.endEditing(true)
    }
    
    
// MARK: - IBActions
    @IBAction func forgotUrNameTapped() {
        self.view.endEditing(true)
        let alert = UIAlertController(title: "Forgot your user name?", message: "Your user name is 'User'", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func forgotUrPswrdTapped() {
        self.view.endEditing(true)
        let alert = UIAlertController(title: "Forgot your password?", message: "Your user name is 'Password'", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        userLoginTF.text = ""
        userPasswordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}
    

