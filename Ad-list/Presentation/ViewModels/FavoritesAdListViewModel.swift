//
//  FavoritesAdListViewModel.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

@Observable
final class FavoritesAdListViewModel {

    private let fetchAdsUseCase: FetchFavoritiesUseCase
    private let makeFavoriteUseCase: MakeFavoriteUseCase
    
    private(set) var adItems: [FavoriteItem] = []
    
    init(
        fetchAdsUseCase: FetchFavoritiesUseCase,
        makeFavoriteUseCase: MakeFavoriteUseCase
    ) {
        self.fetchAdsUseCase = fetchAdsUseCase
        self.makeFavoriteUseCase = makeFavoriteUseCase
    }
    
    func fetchData() async {
        do {
            let fetchedAds = try await fetchAdsUseCase.execute()
            self.adItems.append(contentsOf: fetchedAds)
        }
        catch {
            print(error)
        }
    }
}
