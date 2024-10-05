//
//  NetworkServiceProtocol.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import Combine

protocol NetworkServiceProtocol {
    func fetchSearchResults(query: String) -> AnyPublisher<SearchResults, Error>
    func fetchDetail(for id: String) -> AnyPublisher<DrinkDetailsResult, Error>
}
