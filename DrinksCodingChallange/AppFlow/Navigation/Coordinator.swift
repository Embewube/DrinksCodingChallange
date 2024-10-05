//
//  Coordinator.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 30/09/2024.
//

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
