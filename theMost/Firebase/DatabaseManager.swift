//
//  DatabaseManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseFirestore

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let database = Firestore.firestore()
    
    //check username and email for availability
    public func canCreateAccount(username: String, email: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(newUser : mockUser, completion: @escaping (Bool) -> Void) {
        let reference = database.document("User/\(newUser.username)")
        let data = ["username": newUser.username,
                    "email": newUser.email,
                    ] as [String : Any]
        reference.setData(data) { error in
            completion(error == nil)
        }
    }

    public func findUser(with email: String, completion: @escaping (mockUser?) -> Void){
        let ref = database.collection("User")
        ref.getDocuments { snapshot, error in
            guard let users = snapshot?.documents, error == nil else {
                return
            }
        }
    }

}


