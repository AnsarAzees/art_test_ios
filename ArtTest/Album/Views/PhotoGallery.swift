//
//  PhotoGallery.swift
//  ArtTest
//
//  Created by Ansar on 12/04/22.
//

import SwiftUI

struct PhotoGallery: View {
    @ObservedObject var viewmodel : AlbumViewModel
    var selectedAlbum: Album

    var body: some View {
        PhotoGridView(data: viewmodel.photosList).onAppear {
            self.viewmodel.selectedAlbum = selectedAlbum
            self.viewmodel.photosList = []
            self.viewmodel.loadPhotos()
        }
    }
}

