//
//  APIError.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidData
    case invalidRequest

    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid response received."
        case .invalidData:
            return "Invalid data received."
        case .invalidRequest:
            return "Invalid request."
        }
    }
}

