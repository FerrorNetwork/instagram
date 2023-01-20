//
//  FeedPostItemInfo.swift
//  instagram
//
//  Created by Данил on 19.01.2023.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let userName: String
    let postSubtitle: UIImage
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let usernmae: String
    let commentText: String
}
