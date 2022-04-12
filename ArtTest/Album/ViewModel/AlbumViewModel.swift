//
//  AlbumViewModel.swift
//  ArtTest
//
//  Created by Ansar on 11/04/22.
//

import Foundation
class AlbumViewModel: ObservableObject {
    
    @Published var albumList : Albums
    @Published var photosList : Photos
    @Published var selectedAlbum : Album?
    @Published var loading = false
    @Published var showAlert = false

    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.albumList = []
        self.photosList = []
        self.service = service
    }
    
    func loadPhotos() {
        self.loading = true
                            if let albumId = self.selectedAlbum?.id {
                                self.service.fetchPhotos(albumId: albumId) { photos in
                                    self.photosList = photos ?? []
                                }
                            }
    }
    
    func loadAlbumData() {
        self.loading = true
        if let user = UserDefaultsStoreManager.userData, let id = user.id {
            service.fetchAlbums(userId: id, completion: { albums in
                
                self.loading = false
                
                guard let albums = albums else {
                    return
                }
                
                self.albumList = albums
                

            })
        }
    }
}
