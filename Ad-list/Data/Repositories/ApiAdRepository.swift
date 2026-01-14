//
//  ApiAdRepository.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

protocol AdRepository {
    func fetchNext() async throws -> [AdEntity]
}

final class ApiAdRepository: AdRepository {
    
    private let apiClient: APIClient
    
    private var page = 0
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchNext() async throws -> [AdEntity] {
        let nextPage = page + 1
        let items = try await self.apiClient.fetchAdsItems(page: nextPage)
        page = nextPage
        return items
    }
}
