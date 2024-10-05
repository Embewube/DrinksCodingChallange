//
//  DrinkDetailsViewModel.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import Combine
import Foundation

final class DrinkDetailsViewModel: ObservableObject {
    @Published var item: DrinkDetails?

    private let getDrinkDetailsUseCase: GetDrinkDetailsUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(getDrinkDetailsUseCase: GetDrinkDetailsUseCaseProtocol, itemId: String) {
        self.getDrinkDetailsUseCase = getDrinkDetailsUseCase
        fetchDetail(for: itemId)
    }

    private func fetchDetail(for id: String) {
        getDrinkDetailsUseCase.get(drinkId: id)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Failed to fetch detail: \(error)")
                    }
                },
                receiveValue: { [weak self] detailItem in
                    self?.item = detailItem
                }
            )
            .store(in: &cancellables)
    }
}
