//
//  SearchViewModelProtocol.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 02/10/2024.
//

import Combine

protocol SearchViewModelProtocol {
    var items: AnyPublisher<[SearchResultsItem], Never> { get }

    func search(query: String)
    func showDetails(for item: SearchResultsItem)
}
