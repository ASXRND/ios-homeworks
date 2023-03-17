//
//  CollectionViewCellTableView.swift
//  Navigation
//
//  Created by Александр on 17.03.2023.
//

import UIKit

final class CollectionViewCellTableView: UICollectionViewCell {
    // MARK: - Private Properties

    private let imagePhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()

    // MARK: - Override Methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    // Функция отвечает за показ фото
    func setupImageModel(_ image: PhotoGallery) {
        imagePhoto.image = UIImage(named: image.image)
    }

    // MARK: - Private Methods

    private func setupLayout() {
        contentView.addSubview(imagePhoto)

        NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagePhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imagePhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

