//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Prince Ch on 15/09/24.
//

import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {
    
    // UI Elements
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let recipeImageView = UIImageView()
    let favoriteButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Setup Views and Styles
    func setupViews() {
        // Add subviews
        addSubview(recipeImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(favoriteButton)

        // Recipe Image Styling
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.layer.cornerRadius = 8
        recipeImageView.clipsToBounds = true

        // Title Label Styling
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 1

        // Description Label Styling
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 1

        // Favorite Button Styling
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }

    // Setup Constraints
    func setupConstraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false

        // Recipe Image
        NSLayoutConstraint.activate([
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            recipeImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            recipeImageView.widthAnchor.constraint(equalToConstant: 80),
            recipeImageView.heightAnchor.constraint(equalToConstant: 80)
        ])

        // Title Label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -10)
        ])

        // Description Label
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])

        // Favorite Button
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    // Configure Cell with Recipe Data
    func configure(with recipe: Recipe, isFavorite: Bool) {
        titleLabel.text = recipe.name
        descriptionLabel.text = "Rating: \(recipe.rating)"
        if let url = URL(string: recipe.image) {
            recipeImageView.kf.setImage(with: url)
        }
        favoriteButton.isSelected = isFavorite
    }
}
