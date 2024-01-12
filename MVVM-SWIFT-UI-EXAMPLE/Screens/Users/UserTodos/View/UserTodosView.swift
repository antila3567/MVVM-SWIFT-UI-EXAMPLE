//
//  UserTodosView.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

struct UserTodosView: View {
    var userId: String
    @StateObject var vm = UserTodosViewModel(userService: UserService())
    
    var body: some View {
        UIWithNetwork(
          error: vm.error,
          isLoading: vm.isFetching,
          fetcher: {
              vm.fetchUserTodos(userId)
          },
          errorCleaner: vm.clearError
        ) {
            Text("Count of todos - \(vm.todos.count)")
        }
    }
}

#Preview {
    UserTodosView(userId: "1")
}
