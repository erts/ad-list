//
//  FetchFavoritiesUseCase.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

struct FetchFavoritiesUseCase {
    
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [FavoriteItem] {
        return try await repository.fetchAll()
    }
}
