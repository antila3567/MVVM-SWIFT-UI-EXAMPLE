import Foundation
import Combine

class PostViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    let postService: PostServiceProtocol
    
    @Published var posts: PostModel = []
    @Published var specificPost: Post?
    @Published var isFetching: Bool = false
    @Published var error: String = ""
    
    init(postService: PostServiceProtocol) {
        self.postService = postService
    }
    
    func clearError() {
        error = ""
    }
    
    func handleCompletion(_ data: Subscribers.Completion<Error>) {
        switch data {
        case .failure(let error):
            self.error = (error as? APIError)?.localizedDescription ?? error.localizedDescription
        case .finished:
            print("Fetch finished")
        }
    }
    
    func fetchBuilder<T>(
        publisher: AnyPublisher<T, Error>,
        specificValueHandler: @escaping (T) -> Void
    ) {
        clearError()
        isFetching = true
        defer { isFetching = false }
        
        publisher
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in self.handleCompletion(data) },
                  receiveValue: specificValueHandler)
            .store(in: &cancellables)
    }
    
    func fetchPosts() {
        fetchBuilder(publisher: postService.getPosts()) { [weak self] data in
            self?.posts = data
        }
    }
    
    func fetchSpecificPost(postId: String) {
        fetchBuilder(publisher: postService.getSpecificPost(postId)) { [weak self] data in
            self?.specificPost = data
        }
    }
    
    func createPost(post: CreatePostModel) {
        fetchBuilder(publisher: postService.createPost(newPost: post)) { [weak self] data in
            self?.posts.insert(data, at: 0)
        }
    }
    
    func updateSpecificPost(id: String, updatedPost: Post) {
        fetchBuilder(publisher: postService.updateSpecificPost(id, updatedPost)) { [weak self] data in
            if let index = self?.posts.firstIndex(where: { $0.id == data.id }) {
                self?.posts[index] = data
            }
        }
    }
    
    func deletePostById(id: String) {
        fetchBuilder(publisher: postService.deletePostById(id)) { [weak self] _ in
            self?.posts.removeAll { $0.id == Int(id) }
        }
    }
}
