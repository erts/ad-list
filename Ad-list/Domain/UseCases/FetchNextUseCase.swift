//
//  FetchNextUseCase.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation

struct FetchNextUseCase {
    
    private let repository: AdRepository
    
    init(repository: AdRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [AdEntity] {
        return try await repository.fetchNext()
    }
}
