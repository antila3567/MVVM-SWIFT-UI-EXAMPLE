//
//  UsersListView.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI



struct UsersView: View {
    @StateObject var vm = UsersViewModel(userService: UserService())

      var body: some View {
          UIWithNetwork(
            error: vm.error,
            isLoading: vm.isFetching,
            fetcher: vm.fetchUsers,
            errorCleaner: vm.clearError
          ) {
              UsersList(users: vm.users)
          }
    }
}

#Preview {
    UsersView()
}
