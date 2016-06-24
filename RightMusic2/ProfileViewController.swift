//
//  ProfileViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/20/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    var profileView: ProfileView!
    let ref = DataService.getRTDBSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView = ProfileView(view: view, parent: self)
        profileView.logout.addTarget(self, action: #selector(logout), forControlEvents: .TouchUpInside)
        
        self.navigationController?.navigationBar.hidden = true
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        ref.child("users").child(userID!).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            // Get user value
            print(FIRAuth.auth()?.currentUser?.email)
            let username = snapshot.value!["username"] as! String
            //let email = snapshot.value!["email"] as! String
            //let user = User.init(username: username, email: email)
            self.profileView.username.text = username
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
    
    func logout() {
        let auth = DataService.getAuthSingleton()
        try! auth.signOut()
        self.presentViewController(LoginViewController(), animated: true, completion: nil)
    }
    
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
    
}
