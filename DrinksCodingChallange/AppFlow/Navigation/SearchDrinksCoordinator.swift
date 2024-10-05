//
//  SearchDrinksCoordinator.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 30/09/2024.
//

import UIKit

final class SearchDrinksCoordinator: SearchDrinksCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    private let searchFactory: SearchFactory
    private let drinkDetailsFactory: DrinkDetailsFactory

    init(
        navigationController: UINavigationController,
        searchFactory: SearchFactory,
        drinkDetailsFactory: DrinkDetailsFactory
    ) {
        self.navigationController = navigationController
        self.searchFactory = searchFactory
        self.drinkDetailsFactory = drinkDetailsFactory
    }

    func start() {
        let searchViewController = searchFactory.makeSearchViewController(coordinator: self)
        navigationController.pushViewController(searchViewController, animated: false)
    }

    func showDetails(for itemId: String) {
        let drinkDetailsViewController = drinkDetailsFactory.makeDrinkDetailsViewController(itemId: itemId)
        navigationController.pushViewController(drinkDetailsViewController, animated: true)
    }
}
