//
//  APIEndpoint.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
}



