//
//  SearchViewController.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit
import Combine

final class SearchViewController: UIViewController {
    private let viewModel: SearchViewModelProtocol
    private let searchView: SearchView
    private var dataProvider: SearchResultsTableViewDataProvider?
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: SearchViewModelProtocol, searchView: SearchView) {
        self.viewModel = viewModel
        self.searchView = searchView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()

        navigationController?.title = "Wyszukaj drinki"
    }

    private func setupView() {
        view.addSubview(searchView)
        searchView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        dataProvider = SearchResultsTableViewDataProvider(items: [], tableView: searchView.tableView)

        dataProvider?.didSelectItem = { [viewModel] selectedItem in
            viewModel.showDetails(for: selectedItem)
        }

        searchView.searchBar.searchTextField.addTarget(
            self,
            action: #selector(searchTextChanged),
            for: .editingChanged
        )
    }

    private func setupBindings() {
        viewModel.items
            .receive(on: DispatchQueue.main)
            .sink { [dataProvider] newItems in
                dataProvider?.updateItems(newItems)
            }
            .store(in: &cancellables)
    }

    @objc private func searchTextChanged() {
        guard let searchText = searchView.searchBar.text else { return }
        viewModel.search(query: searchText)
    }
}

