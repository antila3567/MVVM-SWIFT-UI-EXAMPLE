//
//  UserTodosViewModel.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation


import Combine

class UserTodosViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    let userService: UserServiceProtocol
    
    @Published var todos: UserTodosModel = []
    @Published var isFetching: Bool = false
    @Published var error: String = ""
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func clearError() {
        error = ""
    }
    
    func fetchUserTodos(_ userId: String) {
        isFetching = true
        defer { isFetching = false }
        
        userService.getUserTodos(userId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                switch data {
                case .failure(let error):
                    self.error = error.localizedDescription
                case .finished:
                    print("Fetch users todos finished")
                }
        }, receiveValue: {[weak self] data in
            self?.error = ""
            self?.todos = data
        }).store(in: &cancellables)
    }
}

