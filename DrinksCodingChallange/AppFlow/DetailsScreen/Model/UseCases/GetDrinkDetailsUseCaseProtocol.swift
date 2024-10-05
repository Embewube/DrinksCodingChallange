//
//  GetDrinkDetailsUseCaseProtocol.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 05/10/2024.
//

import Combine

protocol GetDrinkDetailsUseCaseProtocol {
    func get(drinkId: String) -> AnyPublisher<DrinkDetails?, Error>
}
