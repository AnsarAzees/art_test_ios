//
//  ParameterModel.swift
//  ArtTest
//
//  Created by Ansar on 10/04/22.
//

import Foundation

typealias Parameters = [Parameter]


struct Parameter: Codable,Identifiable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}
