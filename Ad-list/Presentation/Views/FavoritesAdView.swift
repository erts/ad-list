//
//  FavoritesAdView.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import SwiftUI

struct FavoritesAdView: View {
    
    @State private var viewModel: FavoritesAdListViewModel
    
    init(viewModel: FavoritesAdListViewModel) {
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
                    ForEach(viewModel.adItems, id: \.self) { item in
//                        AdCellView(adItem: item)
                        Text("\(item.timestamp)")
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
                    description: Text("Please make Ad as Favorites")
                )
            }
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

