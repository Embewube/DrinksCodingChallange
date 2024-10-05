//
//  GetSearchResultUseCaseMock.swift
//  DrinksCodingChallangeTests
//
//  Created by Wiktor Biruk on 02/10/2024.
//

@testable import DrinksCodingChallange
import Combine

final class GetSearchResultUseCaseMock {
    enum Action: Equatable {
        case get(query: String)
    }

    var history: [Action] = []
    var simulatedResult: Result<[SearchResultsItem], Error>

    init(simulatedResult: Result<[SearchResultsItem], Error>) {
        self.simulatedResult = simulatedResult
    }
}

extension GetSearchResultUseCaseMock: GetSearchResultsUseCaseProtocol {
    func get(query: String) -> AnyPublisher<[SearchResultsItem], Error> {
        let action = Action.get(query: query)
        history.append(action)

        return simulatedResult.publisher
            .eraseToAnyPublisher()
    }
}
