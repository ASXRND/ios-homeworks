//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {

    //MARK: - Add Label
    let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Button
    var arrowButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()

    //MARK: - Add Action Button
    var galleryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Add Image View
    let imageView_1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Amber Laura Heard")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageView_2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Anastasia Alekseevna Terekhova")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageView_3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Anna Vyalitsyna")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageView_4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Avril Ramona Lavigne")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(galleryButton)
        contentView.addSubview(imageView_1)
        contentView.addSubview(imageView_2)
        contentView.addSubview(imageView_3)
        contentView.addSubview(imageView_4)

        let inset: CGFloat = 13
        let insetImage: CGFloat = 8
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = (screenWidth - 48) / 4
        let imageHeight = imageWidth / 4 * 3

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),

            arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            galleryButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            galleryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            galleryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            imageView_1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            imageView_1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            imageView_1.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView_1.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView_1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),

            imageView_2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            imageView_2.leadingAnchor.constraint(equalTo: imageView_1.trailingAnchor, constant: insetImage),
            imageView_2.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView_2.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView_2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),

            imageView_3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            imageView_3.leadingAnchor.constraint(equalTo: imageView_2.trailingAnchor, constant: insetImage),
            imageView_3.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView_3.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView_3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),

            imageView_4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            imageView_4.leadingAnchor.constraint(equalTo: imageView_3.trailingAnchor, constant: insetImage),
            imageView_4.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView_4.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView_4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}
