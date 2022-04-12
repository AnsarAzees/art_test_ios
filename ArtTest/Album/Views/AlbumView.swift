//
//  AlbumView.swift
//  ArtTest
//
//  Created by Ansar on 11/04/22.
//
import SwiftUI


struct AlbumListView: View {
    @ObservedObject var viewmodel = AlbumViewModel()
   
    var body: some View {
            VStack(alignment: .center) {
                if viewmodel.loading {
                    ActivityIndicator(color: Color.blue, size: 50).accessibilityLabel("activityIndicator")
                } else {
                    if (viewmodel.albumList.count > 0) {
                        List(viewmodel.albumList) { album in
                            NavigationLink(destination: PhotoGallery(viewmodel: viewmodel, selectedAlbum: album)) {
                                PostItemView(heading: album.title ?? "", description:"")
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("No Albums")
                        }
                    }
                }
            }
            
            .navigationBarTitle("Albums")
            .onAppear {
                self.viewmodel.loadAlbumData()
            }

        
    }
}

