//
//  Login.swift
//  ArtTest
//
//  Created by Ansar on 09/04/22.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModel>: View {
    let verticalPaddingForForm = 40.0
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .green]), center: .leading, startRadius: 100, endRadius: 470).ignoresSafeArea()
            if viewModel.loading {
                ActivityIndicator(color: Color.blue, size: 50).accessibilityLabel("activityIndicator")
            } else {
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                Text("Welcome To Art App")
                    .font(.title)
                    .foregroundColor(Color.white)
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Enter your name", text: $viewModel.name,onEditingChanged: { changed in
                        viewModel.isValid = !viewModel.name.isEmpty
                    }).onChange(of: viewModel.name) { newValue in
                        viewModel.isValid = !newValue.isEmpty

                   }
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                if !self.viewModel.isValid {
                            Text("Please enter a name")
                                .font(.callout)
                                .foregroundColor(Color.red)
                        }
                Button(action: {
                    if viewModel.name.isEmpty {
                        viewModel.isValid = false
                    } else {
                        viewModel.isValid = true
                        viewModel.checkUser()
                    }
                }) {
                    Text("Login")
                        .padding()
                    
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
            }.padding(.horizontal, CGFloat(verticalPaddingForForm))
        }
            
        }.alert(isPresented: $viewModel.showAlert) { () -> Alert in
                Alert(title: Text("Login failed"), message: Text("User not found"), primaryButton: .default(Text("Okay"), action: {
                viewModel.showAlert = false
            }), secondaryButton: .default(Text("")))
        }
    };
}


