//
//  FavoritesAdRepository.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation
import SwiftData

protocol FavoritesRepository {
    func fetchAll() async throws -> [FavoriteItem]
    func add(_ item: FavoriteItem)
    func remove(_ item: FavoriteItem)
}

@Model
final class FavoriteItem {
    @Attribute(.unique) var id: UUID
    var timestamp: Date
    var adEntityData: Data
    
    init(entity: Data) {
        self.id = UUID()
        self.timestamp = Date()
        self.adEntityData = entity
    }
}

final class FavoritesRepositoryImlp: FavoritesRepository {
    
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchAll() throws -> [FavoriteItem] {
        let descriptor = FetchDescriptor<FavoriteItem>(
            sortBy: [SortDescriptor(\.timestamp, order: .reverse)]
        )
        return try context.fetch(descriptor)
    }
    
    func add(_ item: FavoriteItem) {
        context.insert(item)
    }
    
    func remove(_ item: FavoriteItem) {
        context.delete(item)
    }
}
