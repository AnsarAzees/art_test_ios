//
//  Photos.swift
//  ArtTest
//
//  Created by Ansar on 11/04/22.
//

import Foundation

// MARK: - Photo
struct Photo: Codable,Identifiable,Hashable {
    var albumID, id: Int?
    var title: String?
    var url, thumbnailUrl: String?

    enum CodingKeys: String, CodingKey {
        case albumID
        case id, title, url
        case thumbnailUrl
    }
}

typealias Photos = [Photo]
