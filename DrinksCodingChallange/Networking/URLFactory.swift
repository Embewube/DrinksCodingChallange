//
//  URLFactory.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

import Foundation

protocol URLFactoryProtocol {
    func makeSearchURL(query: String) -> URL?
    func makeDetailURL(itemId: String) -> URL?
}

class URLFactory: URLFactoryProtocol {
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"

    func makeSearchURL(query: String) -> URL? {
        var components = URLComponents(string: APIEndpoint.search.url(with: baseURL))
        components?.queryItems = [
            URLQueryItem(name: "i", value: query)
        ]
        return components?.url
    }

    func makeDetailURL(itemId: String) -> URL? {
        var components = URLComponents(string: APIEndpoint.details.url(with: baseURL))
        components?.queryItems = [
            URLQueryItem(name: "i", value: itemId)
        ]

        return components?.url
    }
}
