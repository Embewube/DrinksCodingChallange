//
//  APIEndpoint.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import Foundation

enum APIEndpoint: String {
    case search = "/filter.php"
    case details = "/lookup.php"

    func url(with baseURL: String) -> String {
        return "\(baseURL)\(self.rawValue)"
    }
}
