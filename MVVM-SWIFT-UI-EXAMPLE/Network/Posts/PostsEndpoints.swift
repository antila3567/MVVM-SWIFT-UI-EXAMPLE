//
//  UsersEndpoints.swift
//  MVVM-SWIFT-UI-EXAMPLE
//
//  Created by Иван Легенький on 13.01.2024.
//

import Foundation

enum PostsEndpoints: APIEndpoint {
    case getPosts
    case getSpecificPost(postId: String)
    case createPost(post: CreatePostModel)
    case updateSpecificPost(postId: String, post: Post)
    case deletePostById(postId: String)
    
    private var baseInfo: BaseNetworkInfo {
        return BaseNetworkInfo()
    }
    
    var baseURL: URL {
        guard let baseURL = URL(string: baseInfo.base_url) else {
            fatalError("Invalid base URL")
        }
        return baseURL
    }
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getSpecificPost(let postId):
            return "/posts/\(postId)"
        case .createPost:
            return "/posts"
        case .updateSpecificPost(let postId, _):
            return "/posts/\(postId)"
        case .deletePostById(let postId):
            return "/posts/\(postId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        case .getSpecificPost:
            return .get
        case .createPost:
            return .post
        case .updateSpecificPost:
            return .put
        case .deletePostById:
            return .delete
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getPosts:
            return baseInfo.base_headers
        case .getSpecificPost:
            return baseInfo.base_headers
        case .createPost:
            return baseInfo.base_headers
        case .updateSpecificPost:
            return baseInfo.base_headers
        case .deletePostById:
            return baseInfo.base_headers
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .createPost(let post):
            return post.asParameters
        case .updateSpecificPost(_, let updatedPost):
            return updatedPost.asParameters
        case .getPosts, .getSpecificPost, .deletePostById:
            return nil
        }
    }
}

extension Encodable {
    var asParameters: [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            guard let parameters = jsonObject as? [String: Any] else {
                throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [], debugDescription: "Could not convert to dictionary"))
            }
            return parameters
        } catch {
            print("Error encoding parameters: \(error)")
            return nil
        }
    }
}

