//
//  DatabaseManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let database = Database.database().reference()
    
    //check username and email for availability
    public func canCreateAccount(username: String, email: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        database.child(key).setValue(["username" : username]) { error, _ in
            if error == nil {
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
    }
    
    
}

extension String {
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "0", with: "-")
    }
}


