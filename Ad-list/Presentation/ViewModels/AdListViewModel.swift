//
//  AdListViewModel.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation
import Observation

@Observable
final class AdListViewModel {

    private let fetchAdsUseCase: FetchNextUseCase
    private let makeFavoriteUseCase: MakeFavoriteUseCase
    
    private(set) var adItems: [AdViewItem] = []
    
    init(
        fetchAdsUseCase: FetchNextUseCase,
        makeFavoriteUseCase: MakeFavoriteUseCase
    ) {
        self.fetchAdsUseCase = fetchAdsUseCase
        self.makeFavoriteUseCase = makeFavoriteUseCase
    }
    
    func fetchData() async {
        do {
            let fetchedAds = try await fetchAdsUseCase.execute()
            self.adItems.append(contentsOf: fetchedAds.map(AdViewItem.init))
        }
        catch {
            print(error)
        }
    }
}
