//
//  DatabaseManager.swift
//  Chaty
//
//  Created by Ezana Tesfaye on 2/27/21.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
   
    
}


//MARK: - Account Managment
extension DatabaseManager {
    public func userExists(with email:String,completion: @escaping((Bool)-> Void)){
        database.child(email).observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.value as? String != nil else{
                completion(false)
                return
            }
            completion(true)
        }
        
        
    }
    public func inserUser(with user: ChatAppUser){
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name":user.lastName
        
        ])
        
    }
    
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String
}
