//
//  AppDelegate.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 28/09/2024.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var dependencyProvider: DependencyProvider!
    private var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        dependencyProvider = DependencyProvider()

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        let networkService = dependencyProvider.makeNetworkService()
        let searchFactory = SearchFactory(networkService: networkService)
        let drinkDetailsFactory = DrinkDetailsFactory(networkService: networkService)
        appCoordinator = SearchDrinksCoordinator(
            navigationController: navigationController,
            searchFactory: searchFactory,
            drinkDetailsFactory: drinkDetailsFactory
        )

        appCoordinator?.start()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}


