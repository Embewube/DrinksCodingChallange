//
//  SearchResultsTableViewDataProvider.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit

final class SearchResultsTableViewDataProvider: NSObject {
    private var items: [SearchResultsItem]
    private weak var tableView: UITableView?
    var didSelectItem: ((SearchResultsItem) -> Void)?

    init(items: [SearchResultsItem], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()

        self.setup(tableView: tableView)
    }

    func updateItems(_ newItems: [SearchResultsItem]) {
        items = newItems
        tableView?.reloadData()
    }
}

// MARK: - Private

extension SearchResultsTableViewDataProvider {
    private func setup(tableView: UITableView?) {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(
            ResultTableViewCell.self,
            forCellReuseIdentifier: ResultTableViewCell.identifier
        )
    }
}

// MARK: - UITableViewDataSource

extension SearchResultsTableViewDataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ResultTableViewCell.identifier,
            for: indexPath
        ) as! ResultTableViewCell

        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchResultsTableViewDataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedResult = items[indexPath.row]
        didSelectItem?(selectedResult)
    }
}
