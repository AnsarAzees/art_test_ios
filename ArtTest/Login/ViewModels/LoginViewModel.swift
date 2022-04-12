//
//  LoginViewModel.swift
//  ArtTest
//
//  Created by Ansar on 10/04/22.
//

import Combine
import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var postList : Parameters
    @Published var loading = false
    @Published var menuOpen: Bool = false
    @Published var authViewModel: AuthViewModel
    @Published var name: String = ""
    @Published var isValid: Bool = true
    @Published var showAlert = false

    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService(),authViewModel: AuthViewModel) {
        self.postList = []
        self.service = service
        self.authViewModel = authViewModel
    }
    
    func checkUser() {
        self.loading = true
        service.checkUser(userName: name) { users in
            
            DispatchQueue.main.async {
                self.loading = false
            }
            guard let users = users else {
                return
            }
            if !users.isEmpty {
                UserDefaultsStoreManager.userData = users.first
                UserDefaultsStoreManager.isUserLoggedin = true
                self.authViewModel.isAuthenticated = true
            } else {
                self.showAlert = true
            }
            
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}
