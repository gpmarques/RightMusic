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
    var send: UIButton!

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
        email.delegate = parent
        
        // MARK: signUp
        
        let sendUpCGRect: CGRect! = CGRectMake(view.frame.width*0.173913, view.frame.height*0.588315, view.frame.width*0.652174, view.frame.height*0.0700483)
        send = UIButton(frame: sendUpCGRect)
        send.backgroundColor = red
        send.layer.cornerRadius = send.frame.height/2
        send.clipsToBounds = true
        send.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        send.setTitle("Send", forState: .Normal)
        send.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
        
        // MARK: - Add Subviews -
        
        view.addSubview(backgroundImage)
        view.addSubview(email)
        view.addSubview(send)

        
        
    }
    
    private func attributesPlaceholder(string: String, font: UIFont) -> NSAttributedString {
        let attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font])
        
        return attributedPlaceholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
