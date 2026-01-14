//
//  AppContainer.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation
import SwiftData

final class AppContainer {

    lazy var modelContainer: ModelContainer = {
        let schema = Schema([
            FavoriteItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    lazy var apiClient: APIClient = {
//        APIClientImpl()
        MockAPIClientImpl()
    }()

    lazy var apiAdRepository: ApiAdRepository = {
        ApiAdRepository(apiClient: apiClient)
    }()

    lazy var favoritesRepository: FavoritesRepository = {
        FavoritesRepositoryImlp(context: modelContainer.mainContext)
    }()

    
    lazy var fetchNextUseCase: FetchNextUseCase = {
        FetchNextUseCase(repository: apiAdRepository)
    }()
    
    lazy var makeFavoriteUseCase: MakeFavoriteUseCase = {
        MakeFavoriteUseCase(reposoitory: favoritesRepository)
    }()
    
    lazy var makeFetchFavoriteUseCase: FetchFavoritiesUseCase = {
        FetchFavoritiesUseCase(repository: favoritesRepository)
    }()

    func makeAdListViewModel() -> AdListViewModel {
        AdListViewModel(fetchAdsUseCase: fetchNextUseCase, makeFavoriteUseCase: makeFavoriteUseCase)
    }
    
    func makeFavoriteAdListViewModel() -> FavoritesAdListViewModel {
        FavoritesAdListViewModel(fetchAdsUseCase: makeFetchFavoriteUseCase, makeFavoriteUseCase: makeFavoriteUseCase)
    }
}

