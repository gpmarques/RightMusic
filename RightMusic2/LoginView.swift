//
//  LoginView.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/8/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class LoginView: UIView {

    var logo: UIImageView!
    var email, password: UITextField!
    var login,fblogin, forgotPassword, signUpButton: UIButton!
    
    init(view: UIView, parent: LoginViewController) {
        super.init(frame: view.frame)
        
        let placeholderFont = UIFont(name: "SFUIDisplay-Ultralight", size: 18)
        
        // MARK: Background
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        
        // MARK: email
        
        let emailCGRect: CGRect! = CGRectMake(view.frame.width*0.177536, view.frame.height*0.478261, view.frame.width*0.652174, view.frame.height*0.0700483)
        print(view.frame.height*0.478261)
        email = UITextField(frame: emailCGRect)
        email.attributedPlaceholder = attributesPlaceholder("email", font: placeholderFont!)
        email.borderStyle = UITextBorderStyle.None
        email.textColor = UIColor.whiteColor()
        email.font = placeholderFont
        email.keyboardType = .EmailAddress
        email.autocapitalizationType = .None
        email.delegate = parent
        email.autocorrectionType = .No
        
        // MARK: password
        
        
        let passwordCGRect: CGRect! = CGRectMake(view.frame.width*0.177536, view.frame.height*0.55163, view.frame.width*0.652174, view.frame.height*0.0700483)
        print(view.frame.height*0.55163)
        password = UITextField(frame: passwordCGRect)
        password.attributedPlaceholder = attributesPlaceholder("password", font: placeholderFont!)
        password.borderStyle = UITextBorderStyle.None
        password.textColor = UIColor.whiteColor()
        password.font = placeholderFont
        password.autocapitalizationType = .None
        password.delegate = parent
        password.secureTextEntry = true
        password.autocorrectionType = .No
        
        // MARK: login
        
        let loginCGRect: CGRect! = CGRectMake(view.frame.width*0.176328, view.frame.height*0.664402, view.frame.width*0.652174, view.frame.height*0.0700483)
        login = UIButton(frame: loginCGRect)
        login.backgroundColor = red
        login.layer.cornerRadius = login.frame.height/2
        login.clipsToBounds = true
        login.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        login.setTitle("Log in", forState: .Normal)
        login.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
        
        // MARK: facebook login
//        
//        let fbloginCGRect: CGRect! = CGRectMake(view.frame.width*0.176328, view.frame.height*0.664402, view.frame.width*0.652174, view.frame.height*0.0700483)
//        fblogin = UIButton(frame: fbloginCGRect)
//        fblogin.backgroundColor = red
//        fblogin.layer.cornerRadius = login.frame.height/2
//        fblogin.clipsToBounds = true
//        fblogin.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        fblogin.setTitle("Log in", forState: .Normal)
//        fblogin.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
    
        // MARK: Forgot
        
        let forgotPasswordCGRect: CGRect! = CGRectMake(view.frame.width*0.0821256, view.frame.height*0.877717,view.frame.width*0.434783, view.frame.height*0.0507246)
        
        forgotPassword = UIButton(type: .System)
        forgotPassword.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        forgotPassword.setTitle("Forgot password?", forState: .Normal)
        forgotPassword.frame = forgotPasswordCGRect
        forgotPassword.titleLabel?.font = UIFont(name: "SFUIDisplay-Ultralight", size: view.frame.height*0.0316901)
        
        // MARK: Sign Up
        
        let signUpCGRect: CGRect! = CGRectMake(view.frame.width*0.683816, view.frame.height*0.877717, view.frame.width*0.237681, view.frame.height*0.0507246)
        
        signUpButton = UIButton(type: .System)
        signUpButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.frame = signUpCGRect
        signUpButton.titleLabel?.font = UIFont(name: "SFUIDisplay-Ultralight", size: view.frame.height*0.0316901)

        // MARK: Logo
        
        let logoCGRect: CGRect! = CGRectMake(view.frame.width*0.272947, view.frame.height*0.0855978, view.frame.width*0.44686, view.frame.height*0.301932)
        
        logo = UIImageView(frame: logoCGRect)
        logo.center.x = view.frame.width/2
        logo.image = UIImage(named: "logo")
        
        
        // MARK: - Add Subviews -
        
        view.addSubview(backgroundImage)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(login)
        view.addSubview(signUpButton)
        view.addSubview(forgotPassword)
        view.addSubview(logo)
    
    }
    
    private func attributesPlaceholder(string: String, font: UIFont) -> NSAttributedString {
        let attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font])
        
        return attributedPlaceholder
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
