//
//  Comments.swift
//  ArtTest
//
//  Created by Ansar on 10/04/22.
//

import Foundation

// MARK: - Comment
struct Comment: Codable,Identifiable {
    var postID, id: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID
        case id, name, email, body
    }
}

typealias Comments = [Comment]
