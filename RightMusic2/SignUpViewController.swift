//
//  SignUpViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/9/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    var signUpView: SignUpView!
    let dbRef = DataService.getRTDBSingleton()
    let userDAO = UserDAO.getSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView = SignUpView(view: view, parent: self)
        signUpView.signUp.addTarget(self, action: #selector(signUpTapped),
                               forControlEvents: .TouchUpInside)
        signUpView.hasAccount.addTarget(self, action: #selector(hasAccount), forControlEvents: .TouchUpInside)
    }
    
    private func showAlert(title: String, msg: String, actionButton: String
        ){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: actionButton , style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    func hasAccount() {
        self.presentViewController(LoginViewController(), animated: true, completion: nil)
    }
    
    func signUpTapped() {
        
        let username = signUpView.username.text
        let email = signUpView.email.text
        let password = signUpView.password.text
        let confPassword = signUpView.confirmPassword.text
        
        if email != "" && password != "" && confPassword != "" && username != "" {
            
            if password == confPassword {
                
                FIRAuth.auth()?.createUserWithEmail(email!, password: password!, completion: { user, error in
                    
                    if error != nil {
                        
                        if let errorCode = FIRAuthErrorCode(rawValue: error!.code) {
                            switch errorCode {
                            case .ErrorCodeInvalidCredential:
                                self.showAlert("Invalid Credentials!", msg: "Please, try again.", actionButton: "OK")
                            case .ErrorCodeNetworkError:
                                self.showAlert("Network Error!", msg: "An error occurred while attempting to contact the authentication server. Try again", actionButton: "OK")
                            case .ErrorCodeOperationNotAllowed:
                                self.showAlert("Bummer!", msg: "The administrator disabled sign in with the specified identity provider", actionButton: "OK")
                            case .ErrorCodeEmailAlreadyInUse:
                                self.showAlert("Oops!", msg: "The email used to attempt a sign up already exists. Please, try again", actionButton: "OK")
                            case .ErrorCodeInvalidEmail:
                                self.showAlert("Error", msg: "The email is invalid. Try again.", actionButton: "OK")
                            case .ErrorCodeTooManyRequests:
                                self.showAlert("Error", msg: "Too many requests were made to a serve method", actionButton: "OK")
                            case .ErrorCodeWeakPassword:
                                self.showAlert("Error", msg: "Your password must be at least 6 characters long. Try again.", actionButton: "OK")

                                
                            default:
                                self.showAlert("Ups!", msg: "An error occur. Please, try again.", actionButton: "OK")
                            }
                        }
                    } else {
                        let uid = user?.uid
                        self.userDAO.createUser(uid!, username: username!, email: email!)
                        let alert = UIAlertController(title: "Great!", message: "You have successfully signed up.", preferredStyle: .Alert)
                        let action = UIAlertAction(title: "OK" , style: .Default, handler: {action in self.presentViewController(LoginViewController(), animated: true, completion: nil)})
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                
                })
                
            } else {
                self.showAlert("Password Mismatch", msg: "The passwords you've entered do not match. Please, try again", actionButton: "OK")
            }
            
        } else {
            self.showAlert("Empty field", msg: "In order to sign up all fields must be filled. Please, try again", actionButton: "OK")
        }
        
    }
    
    // MARK: Keyboard Dismiss
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
