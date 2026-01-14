//
//  HeartButton.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import SwiftUI

struct HeartButton: View {
    @State var isFavorite = false

    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .font(.title2)
                .foregroundColor(isFavorite ? .red : .white)
        }
        .buttonStyle(.plain)
    }
}
