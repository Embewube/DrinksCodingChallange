//
//  DrinkDetailsResult.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 30/09/2024.
//

struct DrinkDetailsResult: Decodable {
    enum CodingKeys: String, CodingKey {
        case drinkDetails = "drinks"
    }

    let drinkDetails: [DrinkDetails]
}
