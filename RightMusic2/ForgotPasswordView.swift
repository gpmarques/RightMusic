//
//  ForgotPasswordView.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/21/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ForgotPasswordView: UIView {
    
    var email: UITextField!
    var send, rememberPassword: UIButton!
    var notification, notification2, notification3: UILabel!
    
    init(view: UIView, parent: ForgotPasswordViewController) {
        super.init(frame: view.frame)
        
        let textFont = UIFont(name: "SFUIDisplay-Ultralight", size: 18)
        
        // MARK: Background
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        
        // MARK: email
        
        let emailCGRect: CGRect! = CGRectMake(view.frame.width*0.177536, view.frame.height*0.4375, view.frame.width*0.652174, view.frame.height*0.0700483)
        print(view.frame.height*0.478261)
        email = UITextField(frame: emailCGRect)
        email.attributedPlaceholder = attributesPlaceholder("email", font: textFont!)
        email.borderStyle = UITextBorderStyle.None
        email.textColor = UIColor.whiteColor()
        email.font = textFont
        email.keyboardType = .EmailAddress
        email.autocapitalizationType = .None
        
        // MARK: signUp
        
        let sendUpCGRect: CGRect! = CGRectMake(view.frame.width*0.173913, view.frame.height*0.588315, view.frame.width*0.652174, view.frame.height*0.0700483)
        send = UIButton(frame: sendUpCGRect)
        send.backgroundColor = red
        send.layer.cornerRadius = send.frame.height/2
        send.clipsToBounds = true
        send.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        send.setTitle("Send", forState: .Normal)
        send.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
        
        // MARK: notification
        
        let notificationCGRect: CGRect! = CGRectMake(view.frame.width*0.266908, view.frame.height*0.232337, view.frame.width*0.592754, view.frame.height*0.0507246)
        notification = UILabel(frame: notificationCGRect)
        notification.text = "Enter you email below and"
        notification.textColor = UIColor.whiteColor()
        notification.font =  UIFont(name: "SFUIDisplay-Ultralight", size: 17.5)
        notification.textAlignment = .Left
        notification.center.x = view.frame.width/2
        
        let notification2CGRect: CGRect! = CGRectMake(view.frame.width*0.266908, view.frame.height*0.26087, view.frame.width*0.592754, view.frame.height*0.0507246)
        notification2 = UILabel(frame: notification2CGRect)
        notification2.text = "we'll send you a link to reset"
        notification2.textColor = UIColor.whiteColor()
        notification2.font =  UIFont(name: "SFUIDisplay-Ultralight", size: 17)
        notification2.textAlignment = .Left
        notification2.center.x = view.frame.width/2
        
        let notification3CGRect: CGRect! = CGRectMake(view.frame.width*0.268116, view.frame.height*0.289402, view.frame.width*0.358454, view.frame.height*0.0507246)
        notification3 = UILabel(frame: notification3CGRect)
        notification3.text = "your password"
        notification3.textColor = UIColor.whiteColor()
        notification3.font =  UIFont(name: "SFUIDisplay-Ultralight", size: 17)
        notification3.textAlignment = .Left
        notification3.center.x = view.frame.width/2
        
        // MARK: Remember password
        
        let rememberPasswordCGRect: CGRect! = CGRectMake(view.frame.width*0.28744, view.frame.height*0.659511, view.frame.width*0.525121, view.frame.height*0.101449)
        rememberPassword = UIButton(type: .System)
        rememberPassword.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rememberPassword.setTitle("Remember your password? Login", forState: .Normal)
        rememberPassword.frame = rememberPasswordCGRect
        rememberPassword.titleLabel?.font = UIFont(name: "SFUIDisplay-Ultralight", size: 12)
        rememberPassword.center.x = view.frame.width/2

        
        
        // MARK: - Add Subviews -
        
        view.addSubview(backgroundImage)
        view.addSubview(email)
        view.addSubview(send)
        view.addSubview(notification)
        view.addSubview(notification2)
        view.addSubview(notification3)
        view.addSubview(rememberPassword)
        
    }
    
    private func attributesPlaceholder(string: String, font: UIFont) -> NSAttributedString {
        let attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font])
        
        return attributedPlaceholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
