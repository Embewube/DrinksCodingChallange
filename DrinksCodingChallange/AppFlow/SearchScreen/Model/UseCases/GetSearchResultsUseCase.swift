//
//  GetSearchResultsUseCase.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 30/09/2024.
//

import Combine

final class GetSearchResultsUseCase: GetSearchResultsUseCaseProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkSerivce: NetworkServiceProtocol) {
        self.networkService = networkSerivce
    }

    func get(query: String) -> AnyPublisher<[SearchResultsItem], Error> {
        return networkService.fetchSearchResults(query: query)
            .map { $0.drinks }
            .eraseToAnyPublisher()
    }
}
