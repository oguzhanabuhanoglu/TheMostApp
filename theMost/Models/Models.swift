//
//  Models.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import Foundation

//USER
public struct User{
    let profilePhoto : URL
    let name : String
    let username : String
    let bio : String
    let birthDate : Date
    let gender : Gender
    let joinDate : Date
}

enum Gender {
    case male
    case female
    case other
}

//POST
public struct UserPost {
    let identifier : String
    let postUrl : URL
    let dailyChallange : String
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
