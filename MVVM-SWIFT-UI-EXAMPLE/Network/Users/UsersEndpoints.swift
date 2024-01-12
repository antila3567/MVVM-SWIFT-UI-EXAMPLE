//
//  UsersEndpoints.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

enum UsersEndpoints: APIEndpoint {
    case getUsers
    case getUserTodos(userId: String)
    
    private var baseInfo: BaseNetworkInfo {
           return BaseNetworkInfo()
       }
    
    var baseURL: URL {
        guard let baseURL = URL(string: baseInfo.base_url) else {
            fatalError("Invalid base URL")
        }
        return baseURL
    }
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getUserTodos(let userId):
            return "/users/\(userId)/todos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        case .getUserTodos:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getUsers:
            return baseInfo.base_headers
        case .getUserTodos:
            return baseInfo.base_headers
        }
    }
    
//    var parameters: [String: Any]? {
//        switch self {
//        case .getUsers:
//            return ["page": 1, "limit": 10]
//        }
//    }
}
