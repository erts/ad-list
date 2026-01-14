//
//  AdEntity.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

struct AdResponse: Codable {
    let hasConsent: Bool
    let isPersonal: Bool
    let items: [AdEntity]
}

struct AdEntity: Codable, Hashable {
    static func == (lhs: AdEntity, rhs: AdEntity) -> Bool {
        lhs.id == rhs.id
    }
    
    let adType: String
    let description: String?
    let favourite: Favourite?
    let id: String
    let image: AdImage?
    let location: String?
    let price: Price?
    let score: Int?
    let type: String?
    let url: String?
    let version: String?

    enum CodingKeys: String, CodingKey {
        case adType = "ad-type"
        case description
        case favourite
        case id
        case image
        case location
        case price
        case score
        case type
        case url
        case version
    }
}

struct Favourite: Codable, Hashable {
    let itemId: String
    let itemType: String
}

struct AdImage: Codable, Hashable {
    let height: Int?
    let scalable: Bool?
    let type: String?
    let url: String?
    let width: Int?
}

struct Price: Codable, Hashable {
    let value: Int
}
