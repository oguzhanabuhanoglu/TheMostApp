//
//  Models.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import Foundation

public struct User{
    let name : String
    let username : String
    let bio : String
    let birthDate : Date
    let gender : [Gender]
    let joinDate : Date
}

enum Gender {
    case male, female, other
}

public struct UserPosts {
    let identifier : String
    let postUrl : URL
    let thumbnailImage : URL
    let comments : [PostComments]
    let likeCount : [PostLikes]
    let createdDate : Date
}

public struct PostLikes {
    let username : String
    let postIdentifier : String
}

public struct PostComments {
    let identifier : String
    let username : String
    let text : String
    let createdDate : Date
    let likes : [CommentLikes]
}

public struct CommentLikes {
    let commentIdentifier : String
    let username : String
}
