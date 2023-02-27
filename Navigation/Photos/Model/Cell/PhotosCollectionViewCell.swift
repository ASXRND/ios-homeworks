//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    //MARK: - Add Image View
    var colImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        contentView.addSubview(colImageView)

        NSLayoutConstraint.activate ([
            colImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            colImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

