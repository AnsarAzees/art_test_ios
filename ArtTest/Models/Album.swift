//
//  Album.swift
//  ArtTest
//
//  Created by Ansar on 11/04/22.
//

import Foundation

// MARK: - Album
struct Album: Codable,Identifiable {
    var userID, id: Int?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title
    }
}

typealias Albums = [Album]
