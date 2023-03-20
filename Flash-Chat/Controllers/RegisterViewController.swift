//
//  RegisterViewController.swift
//  Flash-Chat
//
//  Created by ヴィヤヴャハレ・アディティア on 18/03/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let validationsCheck = ValidationsCheck()
    var validEmail: Bool = false
    var validPassword: Bool = false
    
    var emailInput: String = ""
    var passwordInput: String = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        emailInput = emailTextField.text!
        passwordInput = passwordTextField.text!
        
        //validate email and password for valid characters.
        if validationsCheck.isValidEmailAddress(emailAddressString: emailInput) {
            print("valid email.")
            validEmail = true
        } else if emailTextField.text == nil {
            print("Please enter email.")
            emailTextField.placeholder = "Please enter email..."
        } else {
            print("Invalid email.")
            emailTextField.textColor = .red
        }
        if validationsCheck.isValidPassword(passwordAddressString: passwordInput) {
            print("Valid password.")
            validPassword = true
        } else if passwordTextField == nil {
            print("Please enter password.")
            passwordTextField.placeholder = "Please enter password"
        } else {
            print("Invalid password.")
            passwordTextField.textColor = .red
        }
        
        //proceed only if data entered is in valid range
        if validEmail == true && validPassword == true {
            Auth.auth().createUser(withEmail: emailInput, password: passwordInput) { authResult, error in
                if let e = error {
                    print("Error in creating user: \(e)")
                } else {
                    //navigate to the chat VC once successfully registered.
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
    //after entering invalid email or password, text color reverts back to default when editing is started
    @IBAction func emailTextFieldisBeingEdited(_ sender: UITextField) {
        emailTextField.textColor = .black    //should be BrandBlue
    }
    
    @IBAction func passwordTextFieldisBeingEdited(_ sender: UITextField) {
        passwordTextField.textColor = .black
    }
}
