//
//  SpalshCoordinator.swift
//  Photune
//
//  Created by Ansar on 19/01/22.
//

import Foundation


protocol SplashCoordinatorProtocol {
    func routeToLoginPage(authViewModel: AuthViewModel)->LoginView<LoginViewModel>
    func routeToHome(authViewModel: AuthViewModel) -> PostListView
}

struct SplashCoordinator : SplashCoordinatorProtocol {
    
    
    func routeToLoginPage(authViewModel: AuthViewModel)-> LoginView<LoginViewModel> {
        let viewModel = LoginViewModel(authViewModel: authViewModel)
        return LoginView(viewModel: viewModel)
    }
    
    func routeToHome(authViewModel: AuthViewModel) -> PostListView {
        return PostListView( viewModel: PostViewModel( authViewModel: authViewModel))
    }
}
