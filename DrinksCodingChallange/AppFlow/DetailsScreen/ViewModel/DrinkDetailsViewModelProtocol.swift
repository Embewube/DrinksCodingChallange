//
//  DrinkDetailsViewModelProtocol.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 05/10/2024.
//

import Combine

protocol DrinkDetailsViewModelProtocol {
    var item: AnyPublisher<DrinkDetails?, Never> { get }
    func loadData()
}
