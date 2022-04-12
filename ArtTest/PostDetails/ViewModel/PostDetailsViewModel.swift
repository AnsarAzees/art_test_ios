//
//  ArticleListViewModel.swift
//  NYTimesMostPopularArticles
//
//  Created by ANSAR on 29/11/21.
//

import Combine

class PostDetailsViewModel: ObservableObject {
    @Published var heading:String
    @Published var details:String
    @Published var comments: Comments
    @Published var isLoading: Bool = false


    let service: ServiceProtocol
    let selectedPost : Parameter

    init(service: ServiceProtocol = APIService(), post: Parameter) {
        heading = post.title ?? ""
        details = post.body ?? ""
        selectedPost = post
        self.service = service
        self.comments = []
    }
    
    func getComments() {
        self.isLoading = true
        if let id = selectedPost.id {
            service.fetchComments(postId: id) { commentsList in
                self.comments = commentsList ?? []
                self.isLoading = false
            }
        }
    }
}
