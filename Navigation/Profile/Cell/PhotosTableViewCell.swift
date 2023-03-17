//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

// MARK: - Protocol PhotosTableViewCellDelegate

protocol PhotosTableViewCellDelegate: AnyObject {
    func galleryButtonAction()
}

final class PhotosTableViewCell: UITableViewCell {

    // MARK: - Public Properties

    weak var delegate: PhotosTableViewCellDelegate?
    // MARK: - Private Properties

    private let photoGallery = PhotoGallery.setupImage()

    // Создаю TableViewCollection для фото на странице TableView в профиле
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero ,collectionViewLayout: layoutCollection)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCellTableView.self, forCellWithReuseIdentifier: CollectionViewCellTableView.identifier)
        return collectionView
    }()

    //MARK: - Add Label
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Button
    private lazy var arrowButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = UIColor(named: "tintButtonColor")
        button.addTarget(self, action: #selector(galleryButtonAction), for: .touchUpInside)
        return button
    }()

    //MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc private func galleryButtonAction() {
        delegate?.galleryButtonAction()
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        contentView.addSubview(collectionView)
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowButton)

        NSLayoutConstraint.activate([

            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowButton.widthAnchor.constraint(equalToConstant: 50),
            arrowButton.heightAnchor.constraint(equalToConstant: 50),

            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12 - 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12 + 8),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}
// MARK: UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTableView.identifier, for: indexPath) as? CollectionViewCellTableView else { return CollectionViewCellTableView() }
        let photoGallery = photoGallery[indexPath.item]
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        cell.setupImageModel(photoGallery)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 3) / 4
        return CGSize(width: height, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: sideInset, bottom: 1, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
}

