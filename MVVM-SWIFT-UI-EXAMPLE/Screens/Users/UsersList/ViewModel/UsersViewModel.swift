//
//  UsersViewModel.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import Foundation

import Combine

class UsersViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    let userService: UserServiceProtocol
    
    @Published var users: UsersModel = []
    @Published var isFetching: Bool = false
    @Published var error: String = ""
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func clearError() {
        error = ""
    }
    
    func fetchUsers() {
        isFetching = true
        defer { isFetching = false }
        
        userService.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                switch data {
                case .failure(let error):
                    self.error = error.localizedDescription 
                case .finished:
                    print("Fetch finished")
                }
        }, receiveValue: {[weak self] data in
            self?.error = ""
            self?.users = data
        }).store(in: &cancellables)
    }
}
