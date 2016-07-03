//
//  SignUpView.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/9/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    var username, email, password, confirmPassword: UITextField!
    var signUp, hasAccount: UIButton!
    
    init(view: UIView, parent: SignUpViewController) {
        super.init(frame: view.frame)
        
        let placeholderFont = UIFont(name: "SFUIDisplay-Ultralight", size: 18)
        print(view.frame.height*0.0434783)
        
        // MARK: Background
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        
        // MARK: username
        
        let usernameCGRect: CGRect! = CGRectMake(view.frame.width*0.171498, view.frame.height*0.290761, view.frame.width*0.652174, view.frame.height*0.0700483)
        username = UITextField(frame: usernameCGRect)
        username.attributedPlaceholder = attributesPlaceholder("username", font: placeholderFont!)
        username.borderStyle = UITextBorderStyle.None
        username.textColor = UIColor.whiteColor()
        username.font = placeholderFont
        username.keyboardType = .Default
        username.autocapitalizationType = .None
        username.delegate = parent
        username.autocorrectionType = .No
        

        // MARK: email
        
        let emailCGRect: CGRect! = CGRectMake(view.frame.width*0.171498, view.frame.height*0.365489, view.frame.width*0.652174, view.frame.height*0.0700483)
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
        
        let passwordCGRect: CGRect! = CGRectMake(view.frame.width*0.171498, view.frame.height*0.440217, view.frame.width*0.652174, view.frame.height*0.0700483)
        password = UITextField(frame: passwordCGRect)
        password.attributedPlaceholder = attributesPlaceholder("password", font: placeholderFont!)
        password.borderStyle = UITextBorderStyle.None
        password.textColor = UIColor.whiteColor()
        password.font = placeholderFont
        password.autocapitalizationType = .None
        password.delegate = parent
        password.secureTextEntry = true
        password.autocorrectionType = .No

        
        // MARK: confirmpassword
        
        let confirmPasswordCGRect: CGRect! = CGRectMake(view.frame.width*0.171498, view.frame.height*0.513587, view.frame.width*0.652174, view.frame.height*0.0700483)
        confirmPassword = UITextField(frame: confirmPasswordCGRect)
        confirmPassword.attributedPlaceholder = attributesPlaceholder("confirm password", font: placeholderFont!)
        confirmPassword.borderStyle = UITextBorderStyle.None
        confirmPassword.textColor = UIColor.whiteColor()
        confirmPassword.font = placeholderFont
        confirmPassword.autocapitalizationType = .None
        confirmPassword.delegate = parent
        confirmPassword.secureTextEntry = true
        confirmPassword.autocorrectionType = .No

        
        // MARK: signUp
        
        let signUpCGRect: CGRect! = CGRectMake(view.frame.width*0.171498, view.frame.height*0.588315, view.frame.width*0.652174, view.frame.height*0.0700483)
        signUp = UIButton(frame: signUpCGRect)
        signUp.backgroundColor = red
        signUp.layer.cornerRadius = signUp.frame.height/2
        signUp.clipsToBounds = true
        signUp.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signUp.setTitle("Sign up", forState: .Normal)
        signUp.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
        print(signUp.titleLabel?.font.fontName)
        
        // MARK: Account
        
        let hasAccountCGRect: CGRect! = CGRectMake(view.frame.width*0.28744, view.frame.height*0.659511, view.frame.width*0.425121, view.frame.height*0.101449)
        hasAccount = UIButton(type: .System)
        hasAccount.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        hasAccount.setTitle("Already a member? Login", forState: .Normal)
        hasAccount.frame = hasAccountCGRect
        hasAccount.titleLabel?.font = UIFont(name: "SFUIDisplay-Ultralight", size: 12)
        
        
        // MARK: - Add Subviews -
        view.addSubview(backgroundImage)
        view.addSubview(username)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(confirmPassword)
        view.addSubview(signUp)
        view.addSubview(hasAccount)
    }
    
    private func attributesPlaceholder(string: String, font: UIFont) -> NSAttributedString {
        let attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font])
        
        return attributedPlaceholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
