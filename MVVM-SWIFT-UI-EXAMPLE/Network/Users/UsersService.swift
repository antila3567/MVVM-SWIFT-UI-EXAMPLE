//
//  UsersService.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func getUsers() -> AnyPublisher<UsersModel, Error>
    func getUserTodos(_ userId: String) -> AnyPublisher<UserTodosModel, Error>
}

class UserService: UserServiceProtocol {
    let apiClient = URLSessionAPIClient<UsersEndpoints>()
    
    func getUsers() -> AnyPublisher<UsersModel, Error> {
        return apiClient.request(.getUsers)
    }
    
    func getUserTodos(_ userId: String) -> AnyPublisher<UserTodosModel, Error> {
        return apiClient.request(.getUserTodos(userId: userId))
    }
    
}
