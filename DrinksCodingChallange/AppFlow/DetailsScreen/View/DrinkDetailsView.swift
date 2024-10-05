//
//  DrinkDetailsView.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit

class DrinkDetailsView: UIView {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        setupImageView()
        setupStackView()
    }

    private func setupStackView() {
        let stackView = UIStackView(
            arrangedSubviews: [
                imageView,
                titleLabel,
                subtitleLabel,
                descriptionLabel,
                UIView(), // spacer view
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = Padding.vertical
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Margin.vertical),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Margin.vertical),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Margin.horizontal),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Margin.horizontal),
        ])
    }

    private func setupImageView() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}
