//
//  SearchViewModel.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

import Combine

class SearchViewModel: ObservableObject {
    private enum Constants {
        static let minimalCharactersCount = 3
    }

    @Published private var itemsPublisher: [SearchResultsItem] = []

    private let getSearchResultsUseCase: GetSearchResultsUseCaseProtocol
    private weak var coordinator: SearchDrinksCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()

    init(getSearchResultsUseCase: GetSearchResultsUseCaseProtocol, coordinator: SearchDrinksCoordinatorProtocol) {
        self.getSearchResultsUseCase = getSearchResultsUseCase
        self.coordinator = coordinator
    }
}

// MARK: - SearchViewModelProtocol

extension SearchViewModel: SearchViewModelProtocol {
    var items: AnyPublisher<[SearchResultsItem], Never> {
        return $itemsPublisher.eraseToAnyPublisher()
    }

    func search(query: String) {
        guard query.count >= Constants.minimalCharactersCount else {
            clear()
            return
        }

        getSearchResultsUseCase.get(query: query)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Failed to fetch search results: \(error)")
                    }
                },
                receiveValue: { [weak self] items in
                    self?.itemsPublisher = items
                }
            )
            .store(in: &cancellables)
    }

    func showDetails(for item: SearchResultsItem) {
        coordinator?.showDetails(for: item.id)
    }
}

// MARK: - Private methods

extension SearchViewModel {
    private func clear() {
        itemsPublisher = []
    }
}
