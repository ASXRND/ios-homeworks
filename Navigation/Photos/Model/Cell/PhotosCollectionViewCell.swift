//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true

        NSLayoutConstraint.activate ([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}

