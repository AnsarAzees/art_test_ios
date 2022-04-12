//
//  GridView.swift
//  ArtTest
//
//  Created by Ansar on 11/04/22.
//

import SwiftUI


struct PhotoGridView: View {
    
    let gridLayout:[GridItem] =  Array(repeating: .init(.flexible(), spacing:10), count: 3)
    
    let data: [Photo]
    
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(data, id: \.self) { item in
                            UrlImageView(urlString: item.thumbnailUrl)
                        }
                    }
                    .padding(.horizontal)
                }
    }
}

