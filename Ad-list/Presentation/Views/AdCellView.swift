//
//  AdCellView.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import SwiftUI

struct AdCellView: View {
    
    private let adItem: AdViewItem
    
    init(adItem: AdViewItem) {
        self.adItem = adItem
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: adItem.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .foregroundColor(.gray)
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 120)
            .clipped()
            .cornerRadius(12)
            
            .overlay (
                ZStack(content: {
                    if let price = adItem.price {
                        Text(price, format:
                                .currency(code: "SEK")
                                .locale(Locale(identifier: "sv_SE"))
                            )
                        .font(.headline)
                        .padding(8)
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding(8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    }
                    
                    HeartButton(isFavorite: false)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(8)
                })
                
                
                , alignment: .bottomLeading
            )
            
            Text("\(adItem.location, default: "Unknown location")")
            Text("\(adItem.description, default: "No title available")")
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
    
}
