//
//  ArticleListViewModel.swift
//  NYTimesMostPopularArticles
//
//  Created by ANSAR on 29/11/21.
//

import Combine
import Foundation


class PostViewModel: ObservableObject {
    
    @Published var postList : Parameters
    @Published var loading = false
    @Published var menuOpen: Bool = false
    @Published var showAlert = false
    @Published var authViewModel: AuthViewModel


    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService(), authViewModel:AuthViewModel) {
        self.postList = []
        self.service = service
        self.authViewModel = authViewModel
    }
    
    
    func logout() {
        self.authViewModel.isBusy = true
        self.authViewModel.isAuthenticated = false
        UserDefaultsStoreManager.clearData()
        self.authViewModel.isBusy = false
        self.authViewModel.checkAuthentication()

    }
    func loadData() {
        self.loading = true
        if let user = UserDefaultsStoreManager.userData, let id = user.id {
            service.fetchPostList(userId: id, completion: { posts in
                self.loading = false
                guard let posts = posts else {
                    return
                }
                self.postList = posts
            })
        }
    }
    
    func toggleMenu() {
        self.menuOpen.toggle()
    }
}
