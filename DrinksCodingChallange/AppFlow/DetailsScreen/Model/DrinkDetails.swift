//
//  DrinkDetails.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

struct DrinkDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case title = "strDrink"
        case subtitle = "strCategory"
        case description = "strInstructions"
        case imageUrl = "strDrinkThumb"
    }
    
    let title: String
    let subtitle: String
    let description: String
    let imageUrl: String
}
