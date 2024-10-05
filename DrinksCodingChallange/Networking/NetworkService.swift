//
//  NetworkService.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

import Combine
import Foundation

class NetworkService: NetworkServiceProtocol {
    private let urlFactory: URLFactoryProtocol

    init(urlFactory: URLFactoryProtocol) {
        self.urlFactory = urlFactory
    }

    private func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func fetchSearchResults(query: String) -> AnyPublisher<SearchResults, Error> {
        guard let url = urlFactory.makeSearchURL(query: query) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetch(url: url)
    }

    func fetchDetail(for id: String) -> AnyPublisher<DrinkDetailsResult, Error> {
        guard let url = urlFactory.makeDetailURL(itemId: id) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return fetch(url: url)
    }
}

