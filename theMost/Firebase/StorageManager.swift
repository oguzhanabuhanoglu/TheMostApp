//
//  StorageManager.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    let bucket = Storage.storage().reference()
    
    public enum storageErrorManager: Error {
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPosts, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping ((Result<URL, storageErrorManager>) -> Void)) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))

        }
        
    }
    
}

public struct UserPosts {
    
}
