//
//  APIClient.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
