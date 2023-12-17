//
//  AuthManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    
    public func registerNewUser(username: String, email: String, password: String, completion : @escaping (Bool) -> Void) {
        //check if username is available
        //check if email is available
        DatabaseManager.shared.canCreateAccount(username: username, email: email) { canCreate in
            if canCreate{
                //create account
                //insert acccount to database
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // failed when creating user
                        completion(false)
                        return
                    }
                    //insert into database
                    
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            //failed when insert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                
                completion(false)
                
            }
        }
    }
    
    
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            //email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                completion(false)
                    return
                }
    
                completion(true)
            }
        }
        else if let username = username {
            //username login
            print(username)
        }
    }
    
    public func logOut(completion : (Bool) -> Void) {
        
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }catch{
            print(error)
            completion(false)
            return
        }
    }
    
}
