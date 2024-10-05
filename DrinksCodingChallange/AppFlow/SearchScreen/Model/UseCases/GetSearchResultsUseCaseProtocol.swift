//
//  GetSearchResultsUseCaseProtocol.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 02/10/2024.
//

import Combine

protocol GetSearchResultsUseCaseProtocol {
    func get(query: String) -> AnyPublisher<[SearchResultsItem], Error>
}
