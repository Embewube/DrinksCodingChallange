//
//  DrinkDetailsViewModel.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import Combine
import Foundation

final class DrinkDetailsViewModel: ObservableObject {
    @Published private var itemPublisher: DrinkDetails?
    private var itemId: String

    private let getDrinkDetailsUseCase: GetDrinkDetailsUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(getDrinkDetailsUseCase: GetDrinkDetailsUseCaseProtocol, itemId: String) {
        self.getDrinkDetailsUseCase = getDrinkDetailsUseCase
        self.itemId = itemId
    }
}

extension DrinkDetailsViewModel: DrinkDetailsViewModelProtocol {
    var item: AnyPublisher<DrinkDetails?, Never> {
        return $itemPublisher.eraseToAnyPublisher()
    }

    func loadData() {
        getDrinkDetailsUseCase.get(drinkId: itemId)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Failed to fetch detail: \(error)")
                    }
                },
                receiveValue: { [weak self] detailItem in
                    self?.itemPublisher = detailItem
                }
            )
            .store(in: &cancellables)
    }
}
