//
//  ProfileView.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/20/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    var username: UILabel!
    var logout: UIButton!

    init(view: UIView, parent: ProfileViewController) {
        super.init(frame: view.frame)
        
        let textFont = UIFont(name: "SFUIDisplay-Ultralight", size: 18)
        
        // MARK: Background
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        
        // MARK: username label
        
        let usernameCGRect: CGRect! = CGRectMake(view.frame.width*0.173913, view.frame.height*0.533967, view.frame.width*0.652174, view.frame.height*0.0700483)
        username = UILabel(frame: usernameCGRect)
        username.textAlignment = .Center
        username.textColor = UIColor.whiteColor()
        username.font = textFont
        username.text = ""
        
        // MARK: logout
        
        let logoutCGRect: CGRect! = CGRectMake(view.frame.width*0.173913, view.frame.height*0.664402,  view.frame.width*0.652174, view.frame.height*0.0700483)
        logout = UIButton(frame: logoutCGRect)
        logout.backgroundColor = red
        logout.layer.cornerRadius = logout.frame.height/2
        logout.clipsToBounds = true
        logout.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        logout.setTitle("Log out", forState: .Normal)
        logout.titleLabel?.font = UIFont(name: "SFUI-Display-Regular", size: 20)
        
        // MARK: addsubview
        
        view.addSubview(backgroundImage)
        view.addSubview(username)
        view.addSubview(logout)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
