//
//  AdViewItem.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

struct AdViewItem: Hashable, Identifiable {
    
    let id: String
    let price: Decimal?
    let image: URL
    let location: String
    let description: String
    
    init(adEntity: AdEntity) {
        
        func completeImageUrl(component: String?) -> URL {
            if let component = component {
                return URL(string: "https://images.finncdn.no/dynamic/480x360c/" + component)!
            } else {
                return Bundle.main.url(forResource: "no_image", withExtension: "png")!
            }
        }
        self.id = adEntity.id
        self.price = adEntity.price?.value != nil ? Decimal(adEntity.price!.value) : nil
        self.image = completeImageUrl(component: adEntity.image?.url)
        self.location = adEntity.location ?? " - "
        self.description = adEntity.description ?? " - "
    }
}
