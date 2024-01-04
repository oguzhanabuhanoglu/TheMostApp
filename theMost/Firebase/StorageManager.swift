//
//  StorageManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    let storage = Storage.storage().reference()
    
    public enum storageErrorManager: Error {
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func uploadProfilePicture(username: String, data: Data?, completion: @escaping (Bool) -> Void){
        guard let data = data else {
            return
        }
        storage.child("\(username)/profile_picture_png").putData(data, metadata: nil) { _, error in
            completion(error == nil)
        }
    }
    
    /*public func downloadImage(with reference: String, completion: @escaping ((Result<URL, storageErrorManager>) -> Void)) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))

        }
        
    }*/
    
}


