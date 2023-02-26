//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {

    let photoGallery: [ImageGallery] = PhotoGallery.randomPhotos(with: 33)

    //MARK: - Add Collection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = #colorLiteral(red: 0.880133905, green: 0.9995045834, blue: 1, alpha: 1)
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutConstraints()
        setupCollectionView()
    }

    //MARK: - Setup Collection View
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }

    //MARK: - Show Navigation Bar
   private func showNavigationBar() {
       navigationController?.setNavigationBarHidden(false, animated: true)
       title = "Gallery"
       navigationController?.navigationBar.barStyle = .black
       navigationController?.navigationBar.backgroundColor = .white
       navigationController?.navigationBar.shadowImage = UIImage()
       navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
   }
}

//MARK: - Extension UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.colImageView.image = UIImage(named: photoGallery[indexPath.item].imageName)
        return cell
    }
}

//MARK: - Extension UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3}
    private var insetsCount: CGFloat { return elementCount + 1}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (collectionView.bounds.width - sideInset * insetsCount) / elementCount
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}
