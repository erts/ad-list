//
//  ContentView.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 10/01/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel: AdListViewModel
    
    init(viewModel: AdListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(minimum: 100, maximum: .infinity)),
                        GridItem(.flexible(minimum: 100, maximum: .infinity))
                    ],
                    alignment: .leading,
                    spacing: 10
                ) {
                    ForEach(viewModel.adItems, id: \.id) { item in
                        AdCellView(adItem: item)
                    }
                }
                .padding()
                
                if viewModel.adItems.isEmpty == false {
                    ProgressView()
                        .frame(height: 300)
                        .task {
                            await viewModel.fetchData()
                        }
                }
            }
        }
        .overlay {
            if viewModel.adItems.isEmpty {
                ContentUnavailableView(
                    "No Ads",
                    systemImage: "photo.on.rectangle",
                    description: Text("No Ads... No Ads...")
                )
            }
        }
        .task {
            await viewModel.fetchData()
        }
    }
}






//#Preview {
//    let apiClient = MockAPIClientImpl()
//    let repository = ApiAdRepository(apiClient: apiClient)
//    let fetchAdsUseCase = FetchNextUseCase(repository: repository)
//    let makeFavoriteUseCase = MakeFavoriteUseCase(reposoitory: <#any FavoritesRepository#>)
//    
//    let viewModel = AdListViewModel(fetchAdsUseCase: fetchAdsUseCase, makeFavoriteUseCase: makeFavoriteUseCase)
//    ContentView(viewModel: viewModel)
//}
