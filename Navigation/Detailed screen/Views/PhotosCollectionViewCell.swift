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
    lazy var collectionImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - SetupGestures
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoAction))
        collectionImageView.isUserInteractionEnabled = true
        collectionImageView.addGestureRecognizer(tapGesture)
    }

    // MARK: - PhotoAction
    @objc private func photoAction() {
        buttonAllPhotoCellDelegate?.tapAction(photo: collectionImageView.image!)
    }

    //MARK: - Setup Layout
    private func setupLayout() {
        contentView.addSubview(collectionImageView)

        NSLayoutConstraint.activate ([
            collectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

