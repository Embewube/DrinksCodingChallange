//
//  SearchResultsItem.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

import Foundation

struct SearchResultsItem: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case title = "strDrink"
        case imageUrl = "strDrinkThumb"
    }

    let id: String
    let title: String
    let imageUrl: String
}
