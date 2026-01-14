//
//  APIClient.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

protocol APIClient {
    func fetchAdsItems(page: Int) async throws -> [AdEntity]
}
