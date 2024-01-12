//
//  UserCard.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

struct UsersList: View {
    var users: UsersModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Users list")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                GeometryReader { geometry in
                    let safeArea = geometry.safeAreaInsets
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(users, id: \.id) { user in
                                NavigationLink(destination: UserTodosView(userId: String(user.id))) {
                                    HStack(spacing: 20) {
                                        Image("user_icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)

                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(user.username)
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(.title2)
                                                .multilineTextAlignment(.leading)
                                            Text(user.name)
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.leading)
     
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrowshape.right")
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.black)
                                .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, safeArea.bottom + 10)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

