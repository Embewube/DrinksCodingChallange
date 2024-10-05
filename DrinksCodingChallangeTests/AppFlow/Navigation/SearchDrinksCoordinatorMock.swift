//
//  SearchDrinksCoordinatorMock.swift
//  DrinksCodingChallangeTests
//
//  Created by Wiktor Biruk on 02/10/2024.
//

@testable import DrinksCodingChallange
import Combine

final class SearchDrinksCoordinatorMock {
    enum Action: Equatable {
        case start
        case showDetails(itemId: String)
    }

    var history: [Action] = []
    var childCoordinators: [Coordinator] = []
}

extension SearchDrinksCoordinatorMock: SearchDrinksCoordinatorProtocol {
    func start() {
        let action = Action.start
        history.append(action)
    }

    func showDetails(for itemId: String) {
        let action = Action.showDetails(itemId: itemId)
        history.append(action)
    }
}
