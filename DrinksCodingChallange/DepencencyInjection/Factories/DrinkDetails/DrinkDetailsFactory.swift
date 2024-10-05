//
//  DrinkDetailsFactory.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

final class DrinkDetailsFactory {
    private let viewFactory: DrinkDetailsViewFactory
    private let networkService: NetworkServiceProtocol

    init(
        viewFactory: DrinkDetailsViewFactory = DrinkDetailsViewFactory(),
        networkService: NetworkServiceProtocol
    ) {
        self.viewFactory = viewFactory
        self.networkService = networkService
    }

    func makeDrinkDetailsViewController(itemId: String) -> DrinkDetailsViewController {
        return DrinkDetailsViewController(
            viewModel: makeDrinkDetailsViewModel(itemId: itemId),
            view: viewFactory.makeDrinkDetailsView()
        )
    }

    private func makeDrinkDetailsViewModel(itemId: String) -> DrinkDetailsViewModel {
        let getDrinkDetailsUseCase = GetDrinkDetailsUseCase(networkService: networkService)
        return DrinkDetailsViewModel(getDrinkDetailsUseCase: getDrinkDetailsUseCase, itemId: itemId)
    }
}
