//
//  Splash.swift
//  Photune
//
//  Created by Ansar on 19/01/22.
//

import SwiftUI

struct Splash<ViewModel: AuthViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    let coordinator: SplashCoordinatorProtocol
    
    init(viewModel: ViewModel, coordinator: SplashCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    var body: some View {
        if(viewModel.isBusy) {
            ZStack{
                VStack{
                    if let fileURL = Bundle.main.url(forResource: "background", withExtension: "jpg") {
                        if let image = UIImage(contentsOfFile: fileURL.path) {
                            Image(uiImage: image).resizable().scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
                        }
                    }
                    
                }}.onAppear {
                    self.viewModel.checkAuthentication()
                }
           
        } else {
            if viewModel.isAuthenticated {
                coordinator.routeToHome(authViewModel: viewModel)
            } else {
                coordinator.routeToLoginPage(authViewModel: viewModel)
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash(viewModel: AuthViewModel(), coordinator: SplashCoordinator())
    }
}
