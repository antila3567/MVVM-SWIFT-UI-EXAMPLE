//
//  UserTodosModel.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

import Foundation

struct UserTodo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias UserTodosModel = [UserTodo]
