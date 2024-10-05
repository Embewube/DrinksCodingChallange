//
//  SearchViewFactory.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit

final class SearchViewFactory {
    func makeSearchView() -> SearchView {
        let searchView = SearchView()
        styleSearchView(searchView)
        return searchView
    }

    private func styleSearchView(_ searchView: SearchView) {
        searchView.searchBar.placeholder = "Składnik"
        searchView.searchBar.backgroundImage = UIImage()

        searchView.tableView.backgroundColor = Color.background
        searchView.tableView.separatorStyle = .singleLine

        searchView.backgroundColor = Color.background
    }
}

