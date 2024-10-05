//
//  DrinkDetailsViewController.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit
import Combine
import Kingfisher

final class DrinkDetailsViewController: UIViewController {
    private let drinkDetailsView: DrinkDetailsView
    private let viewModel: DrinkDetailsViewModelProtocol
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: DrinkDetailsViewModelProtocol, view: DrinkDetailsView) {
        self.viewModel = viewModel
        self.drinkDetailsView = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(drinkDetailsView)
        drinkDetailsView.frame = view.bounds

        setupBindings()
        viewModel.loadData()
    }

    private func setupBindings() {
        viewModel.item
            .receive(on: DispatchQueue.main)
            .sink { [drinkDetailsView] item in
                guard let item = item else { return }
                drinkDetailsView.titleLabel.text = item.title
                drinkDetailsView.subtitleLabel.text = item.subtitle
                drinkDetailsView.descriptionLabel.text = item.description
                drinkDetailsView.imageView.kf.setImage(with: URL(string: item.imageUrl))
            }
            .store(in: &cancellables)
    }
}
