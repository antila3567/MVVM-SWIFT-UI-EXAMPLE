//
//  PostModel.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 13.01.2024.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

struct CreatePostModel: Codable {
    let userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case title, body
    }
}

typealias PostModel = [Post]
