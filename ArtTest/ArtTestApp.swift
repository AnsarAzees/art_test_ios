//
//  ArtTestApp.swift
//  ArtTest
//
//  Created by Ansar on 09/04/22.
//

import SwiftUI

@main
struct ArtTestApp: App {
    var authViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            Splash(viewModel: authViewModel, coordinator: SplashCoordinator())
        }
    }
}
