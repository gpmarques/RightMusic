//
//  User.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/14/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

class User {
    
    private var userid ,username, email: String!
    
    init(username: String, email: String){
        self.username = username
        self.email = email
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getEmail() -> String {
        return email
    }
    
    func setUsername(username: String) {
        self.username = username
    }
    
    
}
