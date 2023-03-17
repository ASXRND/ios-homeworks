//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

// MARK: - Protocol PhotoCellDelegate

protocol PhotoCellDelegate: AnyObject {
    func tapAction(photo: UIImage)
    func cancelAnimationButton()
}

final class CollectionViewCell: UICollectionViewCell {

    weak var buttonAllPhotoCellDelegate: PhotoCellDelegate?

    //MARK: - Add Image View
    var collectionImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutConstraints()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private Methods

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoAction))
        collectionImageView.isUserInteractionEnabled = true
        collectionImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func photoAction() {
        buttonAllPhotoCellDelegate?.tapAction(photo: collectionImageView.image!)
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        contentView.addSubview(collectionImageView)

        NSLayoutConstraint.activate ([
            collectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

