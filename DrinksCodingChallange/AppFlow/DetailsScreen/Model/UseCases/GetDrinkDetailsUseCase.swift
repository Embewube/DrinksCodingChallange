//
//  GetDrinkDetailsUseCase.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 30/09/2024.
//

import Combine

final class GetDrinkDetailsUseCase: GetDrinkDetailsUseCaseProtocol {
    let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func get(drinkId: String) -> AnyPublisher<DrinkDetails?, Error> {
        networkService.fetchDetail(for: drinkId)
            .map { $0.drinkDetails.first }
            .eraseToAnyPublisher()
    }
}

