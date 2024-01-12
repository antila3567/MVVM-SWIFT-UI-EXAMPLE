//
//  BaseInfo.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

enum Environment  {
    case dev
    case production
}
class EnvironmentManager {
    #if PRODUCTION
        static let environment: Environment = .production
    #else
        static let environment: Environment = .dev
    #endif
}

class BaseNetworkInfo {
    var base_url: String {
        switch EnvironmentManager.environment {
           case .dev: return "https://jsonplaceholder.typicode.com"
           case .production: return "https://jsonplaceholder.typicode.com-prod"
        }
    }
    
    var base_headers: [String: String] {
        switch EnvironmentManager.environment {
           case .dev: return [
            "Content-type": "application/json; charset=utf-8",
           ]
           
           case .production: return [
            "Content-type": "application/json; charset=utf-8",
           ]
        }
    }
}
