//
//  DependencyProvider.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import Foundation

final class DependencyProvider {
    private func makeURLFactory() -> URLFactory {
        return URLFactory()
    }

    func makeNetworkService() -> NetworkServiceProtocol {
        let urlFactory = makeURLFactory()
        return NetworkService(urlFactory: urlFactory)
    }
}

