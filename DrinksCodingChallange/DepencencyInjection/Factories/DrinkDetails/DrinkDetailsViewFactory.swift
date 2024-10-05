//
//  DrinkDetailsViewFactory.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit

final class DrinkDetailsViewFactory {
    func makeDrinkDetailsView() -> DrinkDetailsView {
        let DrinkDetailsView = DrinkDetailsView()
        styleDrinkDetailsView(DrinkDetailsView)

        return DrinkDetailsView
    }

    private func styleDrinkDetailsView(_ drinkDetailsView: DrinkDetailsView) {
        drinkDetailsView.titleLabel.font = Font.title
        drinkDetailsView.titleLabel.textColor = Color.text

        drinkDetailsView.subtitleLabel.font = Font.subtitle
        drinkDetailsView.subtitleLabel.textColor = Color.textAlternative

        drinkDetailsView.descriptionLabel.font = Font.description
        drinkDetailsView.descriptionLabel.textColor = Color.text

        drinkDetailsView.backgroundColor = Color.background
    }
}
