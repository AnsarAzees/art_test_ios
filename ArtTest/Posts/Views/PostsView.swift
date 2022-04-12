//
//  PostsView.swift
//  ArtTest
//
//  Created by Ansar on 09/04/22.
//

import SwiftUI


struct PostListView: View {
    @ObservedObject var viewmodel : PostViewModel
    
    init(viewModel:PostViewModel) {
        self.viewmodel = viewModel
    
        }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack(alignment: .center) {
                    if viewmodel.loading {
                        ActivityIndicator(color: Color.blue, size: 50).accessibilityLabel("activityIndicator")
                    } else {
                        if (viewmodel.postList.count > 0) {
                            List(viewmodel.postList) { post in
                                let id = post.id?.description
                                NavigationLink(destination: PostDetails(post: post)){
                                    PostItemView(heading: post.title ?? "", description: post.body ?? "").accessibilityLabel(id ?? "")
                                }
                            }.accessibilityLabel("listView")
                        } else {
                            VStack(alignment: .center) {
                                Text("No post or error")
                            }
                        }
                    }
                }.zIndex(self.viewmodel.menuOpen ? -1 :1)
                SideMenu(width: 270,
                         isOpen: self.viewmodel.menuOpen,
                         menuClose: self.viewmodel.toggleMenu,
                         dashboardPressed: {
                    self.viewmodel.toggleMenu()
                },albumPressed: {
                    self.viewmodel.toggleMenu()
                    

                },logoutPressed: {
                    self.viewmodel.toggleMenu()
                    self.viewmodel.showAlert = true
                }
                
                ).zIndex(self.viewmodel.menuOpen ? 1 :-1)
            }
            .navigationBarItems(leading: (
                                Button(action: {
                                    withAnimation {
                                        self.viewmodel.toggleMenu()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .imageScale(.large)
                                }
                            ))
            .navigationBarTitle("Posts", displayMode: .inline)
            .onAppear {
                self.viewmodel.loadData()
            }.alert(isPresented: $viewmodel.showAlert) { () -> Alert in
                Alert(title: Text("Logout"), message: Text("Are you sure you need to logout?"), primaryButton: .default(Text("Logout"), action: {
                    self.viewmodel.logout()
            }), secondaryButton: .cancel(Text("Cancel")))
        }
        }
    }
}
