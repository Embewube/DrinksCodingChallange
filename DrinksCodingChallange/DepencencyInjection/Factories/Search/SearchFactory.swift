//
//  SearchFactory.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

final class SearchFactory {
    private let viewFactory: SearchViewFactory
    private let networkService: NetworkServiceProtocol

    init(
        viewFactory: SearchViewFactory = SearchViewFactory(),
        networkService: NetworkServiceProtocol
    ) {
        self.viewFactory = viewFactory
        self.networkService = networkService
    }

    func makeSearchViewController(coordinator: SearchDrinksCoordinatorProtocol) -> SearchViewController {
        return SearchViewController(
            viewModel: makeSearchViewModel(coordinator: coordinator),
            searchView: viewFactory.makeSearchView()
        )
    }

    private func makeSearchViewModel(coordinator: SearchDrinksCoordinatorProtocol) -> SearchViewModel {
        let getSearchResultsUseCase = GetSearchResultsUseCase(networkSerivce: networkService)
        return SearchViewModel(getSearchResultsUseCase: getSearchResultsUseCase, coordinator: coordinator)
    }
}
