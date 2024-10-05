//
//  ResultTableViewCell.swift
//  DrinksCodingChallange
//
//  Created by Wiktor Biruk on 29/09/2024.
//

import UIKit
import Kingfisher

class ResultTableViewCell: UITableViewCell {
    private enum Constants {
        static let imageSize: CGFloat = 100
    }

    static let identifier = "ResultTableViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.listItem
        label.numberOfLines = 1
        return label
    }()

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Padding.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        stackView.addArrangedSubview(thumbnailImageView)
        stackView.addArrangedSubview(titleLabel)

        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin.horizontal),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin.horizontal),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Padding.vertical),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Padding.vertical),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize)
        ])
    }

    func configure(with item: SearchResultsItem) {
        titleLabel.text = item.title
        thumbnailImageView.kf.setImage(
            with: URL(string: item.imageUrl)
        )
    }
}

