//
//  LoginViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/8/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    var loginView: LoginView!
    var myActivityIndicator: UIActivityIndicatorView!
    let userDAO = UserDAO.getSingleton()
    let musicDAO = MusicDAO.getSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDAO.getCurrentUser() != nil {
            self.presentViewController(ProfileViewController(), animated: true, completion: nil)
        }
        
        loginView = LoginView(view: view, parent: self)
        loginView.signUpButton.addTarget(self, action: #selector(signUp),
                                         forControlEvents: .TouchUpInside)
        loginView.login.addTarget(self, action: #selector(login),
                                         forControlEvents: .TouchUpInside)
        loginView.forgotPassword.addTarget(self, action: #selector(forgotPassword),
                                           forControlEvents: .TouchUpInside)
        myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        myActivityIndicator.center = CGPoint(x: view.center.x , y: view.frame.height*0.429348)
        view.addSubview(myActivityIndicator)
        
        //MARK: - TIRAR ESSA PORRA DEPOIS
        
        pegaCifraMusica("https://www.cifraclub.com.br/foo-fighters/big-me/")
        musicDAO.createMusic("BIGME001", name: "Big Me", chords: cifra, genre: "Rock", tone: tom, lyrics: letra)
        print(tom)
        print(letra)
        print(cifra)
        pegaCifraMusica("https://www.cifraclub.com.br/jack-johnson/breakdown/")
        musicDAO.createMusic("BREAKDOWN002", name: "Breakdown", chords: cifra, genre: "Alternativo", tone: tom, lyrics: letra)
        print(tom)
        print(letra)
        print(cifra)
        pegaCifraMusica("https://www.cifraclub.com.br/foo-fighters/learn-to-fly-acoustic-version/")
        musicDAO.createMusic("LEARNTOFLY003", name: "Learn To Fly", chords: cifra, genre: "Rock", tone: tom, lyrics: letra)
        print(tom)
        print(letra)
        print(cifra)
        
    }
    
    // MARK: Sing Up Function
    
    func signUp (sender: UIButton!) {
        self.presentViewController(SignUpViewController(), animated: true, completion: nil)
    }
    // MARK: ShowAlert
    private func showAlert(title: String, msg: String, actionButton: String
        ){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: actionButton , style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK: Login Function
    
    func login() {
        let email = loginView.email.text
        let password = loginView.password.text
        myActivityIndicator.startAnimating()
        FIRAuth.auth()?.signInWithEmail(email!, password: password!, completion: { user, error in
            
            if error != nil {
                self.myActivityIndicator.stopAnimating()
                if let errorCode = FIRAuthErrorCode(rawValue: error!.code) {
                    switch errorCode {
                        case .ErrorCodeWrongPassword:
                            self.showAlert("You have entered an invalid username or password.", msg: "Please, try again.", actionButton: "OK")
                        case .ErrorCodeUserDisabled:
                            self.showAlert("This account is disabled", msg: "Please try a different account.", actionButton: "OK")
                        case .ErrorCodeNetworkError:
                            self.showAlert("Network Error!", msg: "An error occurred while attempting to contact the authentication server. Try again", actionButton: "OK")
                        case .ErrorCodeTooManyRequests:
                            self.showAlert("Error", msg: "Please, try again.", actionButton: "OK")
                        
                        default:
                            self.showAlert("Ups!", msg: "An error occurred. Please, try again.", actionButton: "OK")
                    }
                }
            } else {
                self.myActivityIndicator.stopAnimating()
                self.presentViewController(TabBarViewController(), animated: true, completion: nil)
            }
            
        })
    }
    
    // MARK: Forgot Password
    
    func forgotPassword() {
        self.presentViewController(ForgotPasswordViewController(), animated: true, completion: nil)
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