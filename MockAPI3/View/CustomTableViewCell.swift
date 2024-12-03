//
//  CustomTableViewCell.swift
//  MockAPI3
//
//  Created by Muralidhar reddy Kakanuru on 12/3/24.
//


import UIKit

class CustomTableViewCell: UITableViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        contentView.addSubview(articleImageView)
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleImageView.widthAnchor.constraint(equalToConstant: 100),
            articleImageView.heightAnchor.constraint(equalToConstant: 100),

            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with article: Meal) {
        let text = """
        IdMeal: \(article.idMeal ?? "")
        StrMeal: \(article.strMeal ?? "")
        """
        label.text = text

        if let imageUrl = article.strMealThumb {
            DataGit.shared.getImage(url: imageUrl) { [weak self] image in
                self?.articleImageView.image = image ?? UIImage(named: "placeholder")
            }
        } else {
            articleImageView.image = UIImage(named: "placeholder")
        }
    }

}

