//
//  AuthManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseAuth
import UIKit

public class AuthManager {
    
    static let shared = AuthManager()
    
    let auth = Auth.auth()
    enum AuthError : Error {
        case newUserCreation
    }
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func signUp(username: String, email: String, password: String,profilePicture: Data?, completion : @escaping (Result<mockUser, Error>) -> Void) {
        //check if username is available
        //check if email is available
        DatabaseManager.shared.canCreateAccount(username: username, email: email) { canCreate in
            if canCreate{
                //create account
                //insert acccount to database
                let newUser = mockUser(username: username, email: email)
                auth.createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // failed when creating user
                        completion(.failure(AuthError.newUserCreation))
                        return
                    }
                    //insert into database
                    
                    DatabaseManager.shared.insertNewUser(newUser: newUser) { succes in
                        if succes {
                            StorageManager.shared.uploadProfilePicture(username: username, data: profilePicture) { uploadSucces in
                                if uploadSucces {
                                    completion(.success(newUser))
                                }else{
                                    completion(.failure(AuthError.newUserCreation))
                                }
                            }
                        }else{
                            completion(.failure(AuthError.newUserCreation))
                        }
                    }
                }
            } else {
                
                completion(.failure(AuthError.newUserCreation))
                
            }
        }
    }
    
    
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Result<mockUser, Error>) -> Void) {
        if let email = email {
            //email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    return
                }
    
            
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
    
    public func makeAlert(tittleInput: String , messageInput: String){
           
           let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
           let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(okButton)
       }
}
