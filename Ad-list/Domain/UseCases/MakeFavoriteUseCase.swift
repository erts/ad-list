//
//  MakeFavoriteUseCase.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

struct MakeFavoriteUseCase {
    
    let reposoitory: FavoritesRepository
    
    init(reposoitory: FavoritesRepository) {
        self.reposoitory = reposoitory
    }
    
    func execute(adEntity: AdEntity) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(adEntity) {
            self.reposoitory.add(FavoriteItem(entity: data))
        } else {
            // handle error
        }
    }
}
