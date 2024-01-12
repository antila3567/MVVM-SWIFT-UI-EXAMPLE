//
//  UsersModel.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias UsersModel = [UserModel]

