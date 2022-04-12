//
//  ViewModel.swift
//  Photune
//
//  Created by Ansar on 20/01/22.
//

import Foundation
import SwiftUI

protocol SplashViewModelProtocol:ObservableObject{
    func checkAuthentication()
    
}


class AuthViewModel: SplashViewModelProtocol,ObservableObject{
    
    @Published var isBusy = true
    @Published var isAuthenticated = false
    
    
    
    
    func checkAuthentication() {
        self.isBusy = true
        if UserDefaultsStoreManager.isUserLoggedin  {
            self.isBusy = false
            self.isAuthenticated = true
        } else {
            self.isBusy = false
            self.isAuthenticated = false
        }
    }
    
    
    
}
