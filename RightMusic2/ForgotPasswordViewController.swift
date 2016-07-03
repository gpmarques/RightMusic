//
//  ForgotPasswordViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/21/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

    var forgotPasswordView: ForgotPasswordView!
    var myActivityIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        forgotPasswordView = ForgotPasswordView(view: view, parent: self)
        forgotPasswordView.send.addTarget(self, action: #selector(sendEmail), forControlEvents: .TouchUpInside)
        forgotPasswordView.rememberPassword.addTarget(self, action: #selector(goToLogin), forControlEvents: .TouchUpInside)
        myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        myActivityIndicator.center = CGPoint(x: view.center.x , y: view.frame.height*0.429348)
        view.addSubview(myActivityIndicator)
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: Send Email
    
    func sendEmail() {
        let auth = DataService.getAuthSingleton()
        let email = forgotPasswordView.email.text
        myActivityIndicator.startAnimating()
        if  email != nil || email != "" {
            auth.sendPasswordResetWithEmail(email!) { error in
            
                if error != nil {
                
                    if let errorCode = FIRAuthErrorCode(rawValue: error!.code) {
                        switch errorCode {
                        case .ErrorCodeKeychainError:
                            self.showAlert("Error", msg: "An error occurred. Please, try again.", actionButton: "OK")
                        case .ErrorCodeNetworkError:
                            self.showAlert("Network Error!", msg: "An error occurred while attempting to contact the authentication server. Try again", actionButton: "OK")
                        case .ErrorCodeInvalidEmail:
                            self.showAlert("Error", msg: "The email you entered is invalid. Try again.", actionButton: "OK")
                        default:
                            self.showAlert("Ups!", msg: "An error occurred. Please, try again.", actionButton: "OK")
                        }
                    }
                } else {
                    NSOperationQueue.mainQueue().addOperationWithBlock {
                        self.myActivityIndicator.stopAnimating()
                        self.showAlert("", msg: "Password reset email sent!", actionButton: "OK")
                    }
                }
            
            }
        }
        self.myActivityIndicator.stopAnimating()
        
        
    }
    
    // MARK: ShowAlert
    private func showAlert(title: String, msg: String, actionButton: String
        ){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: actionButton , style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Go to Login
    
    func goToLogin() {
        self.presentViewController(LoginViewController(), animated: true, completion: nil)
    }
    
}
