//
//  UserDAO.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/14/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation
import Firebase

class UserDAO {
    
    let ref = DataService.getRTDBSingleton()
    let auth = DataService.getAuthSingleton()
    static let userDAO = UserDAO()
    
    
    private init() {}
    
    // MARK: Create User in the RealTime Database
    
    func createUser(uid: String, username: String, email: String) {
        let userDic = ["username": username, "email": email]
        ref.child("users").child(uid).setValue(userDic)
    }
    
    // MARK: Delete User in the RealTime Database
    
    func deleteUser() {
    
        let user = getCurrentUser()

        user?.deleteWithCompletion { error in
            if error != nil {
                // An error happened.
            } else {
                // Account deleted.
            }
            
        }
    }
    
    // MARK: Get current user
    
    func getCurrentUser() -> FIRUser? {
        if let currentUser = auth.currentUser {
            return currentUser
        } else {
            // No user is signed in.
            return nil
        }
    }
    
    // MARK: get userdao singleton
    
    static func getSingleton() -> UserDAO {
        return userDAO
    }
    
}