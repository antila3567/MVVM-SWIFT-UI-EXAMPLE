//
//  PostsView.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 12.01.2024.
//

import SwiftUI

struct PostsView: View {
    @StateObject private var vm = PostViewModel(postService: PostService())

    var body: some View {
        VStack {
            UIWithNetwork(
                error: vm.error,
                isLoading: vm.isFetching,
                fetcher: vm.fetchPosts,
                errorCleaner: vm.clearError
            ) {
                NavigationView {
                    List(vm.posts, id: \.id) { post in
                        NavigationLink(
                            destination: {
                                SpecificPostView(vm: vm, postId: String(post.id))
                            },
                            label: {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(post.title)
                                    Text("Post id - \(post.id)")
                                }
                            }
                        )
                    }
                    .navigationTitle("Posts")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                vm.createPost(
                                    post:
                                        CreatePostModel(
                                            userID: 1,
                                            title: "Hello",
                                            body: "Some content"
                                        )
                                )
                            }) {
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    PostsView()
}
