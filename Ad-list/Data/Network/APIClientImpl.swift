//
//  APIClientImpl.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 14/01/2026.
//

import Foundation


final class APIClientImpl: APIClient {
    
    private let kServerScheme = "http"
    private let kServerAddress = "localhost"
    private let kServerPort = 3001
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    func fetchAdsItems(page: Int) async throws -> [AdEntity] {
        var components = URLComponents()
        components.scheme = kServerScheme
        components.host = kServerAddress
        components.port = kServerPort
        components.path = "/api/ad-items"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let (data, _) = try await urlSession.data(for: request)
        let response = try JSONDecoder().decode(AdResponse.self, from: data)
        return response.items
    }
}


final class MockAPIClientImpl: APIClient {
    
    
    func fetchAdsItems(page: Int) async throws -> [AdEntity] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            throw NSError(domain: "File not found", code: 1)
        }
        
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(AdResponse.self, from: data)
        return response.items
    }
}
