//
//  DataService.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/14/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    private static let rootRef = FIRDatabase.database().reference()
    private static let auth = FIRAuth.auth()
    
    
    // Get Real Time Database Singleton
    static func getRTDBSingleton() -> FIRDatabaseReference {
        return rootRef
    }
    
    static func getAuthSingleton() -> FIRAuth {
        return auth!
    }
    
}
