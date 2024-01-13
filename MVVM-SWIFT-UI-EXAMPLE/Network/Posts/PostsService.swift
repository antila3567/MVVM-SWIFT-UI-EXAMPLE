//
//  PostsService.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 13.01.2024.
//

import Foundation
import Combine

protocol PostServiceProtocol {
    func getPosts() -> AnyPublisher<PostModel, Error>
    func getSpecificPost(_ postId: String) -> AnyPublisher<Post, Error>
    func updateSpecificPost(_ postId: String, _ updatedPost: Post) -> AnyPublisher<Post, Error>
    func createPost(newPost: CreatePostModel) -> AnyPublisher<Post, Error>
    func deletePostById(_ postId: String) -> AnyPublisher<Data, Error>
}

class PostService: PostServiceProtocol {
    let apiClient = URLSessionAPIClient<PostsEndpoints>()
    
    func getPosts() -> AnyPublisher<PostModel, Error> {
        return apiClient.request(.getPosts)
    }
    
    func getSpecificPost(_ postId: String) -> AnyPublisher<Post, Error> {
        return apiClient.request(.getSpecificPost(postId: postId))
    }
    
    func updateSpecificPost(_ postId: String, _ updatedPost: Post) -> AnyPublisher<Post, Error> {
        return apiClient.request(.updateSpecificPost(postId: postId, post: updatedPost))
    }
    
    func createPost(newPost: CreatePostModel) -> AnyPublisher<Post, Error> {
        return apiClient.request(.createPost(post: newPost))
    }
    
    func deletePostById(_ postId: String) -> AnyPublisher<Data, Error> {
        return apiClient.request(.deletePostById(postId: postId))
            .tryMap { (result: [String: String]) -> Data in
                return try JSONSerialization.data(withJSONObject: [])
            }
            .eraseToAnyPublisher()
    }

}

