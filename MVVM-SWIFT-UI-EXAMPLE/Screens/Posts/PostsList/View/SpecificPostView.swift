//
//  SpecificPostView.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 13.01.2024.
//

import SwiftUI

import SwiftUI


struct SpecificPostView: View {
    @ObservedObject var vm: PostViewModel
    var postId: String = ""
    
    var body: some View {
        UIWithNetwork(
            error: vm.error,
            isLoading: vm.isFetching,
            fetcher: { vm.fetchSpecificPost(postId: postId) },
            errorCleaner: vm.clearError
        ) {
            PostCard(specificPost: vm.specificPost)
        }
    }
    
    
    @ViewBuilder
    func PostCard(specificPost: Post?) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let post = specificPost {
                Text(post.title)
                    .font(.title2)
                Text(post.body)
                
                HStack {
                    Button {
                        vm.updateSpecificPost(id: postId, updatedPost: Post(
                            userID: 1,
                            id: post.id,
                            title: "Updated title",
                            body: "Updated body must be here"
                        ))
                    } label: {
                        Text("Update Post")
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    
                    Spacer()
                
                    Button {
                        vm.deletePostById(id: postId)
                    } label: {
                        Text("Delete Post")
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.white)
              
                }
                .padding(.top, 20)

            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    SpecificPostView(vm: PostViewModel.init(postService: PostService()), postId: "1")
}

