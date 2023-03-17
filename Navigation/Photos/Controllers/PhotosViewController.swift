//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {

    let photoGallery: [PhotoGallery] = PhotoGallery.setupImage()

    //MARK: - Add Collection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Создаю черную вью для заднего фона при открытии фото на весь экран
    private let blackView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()

    // Создаю кнопку крестик для выхода из полноэкранного режима
    private lazy var buttonCancelAnimation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemGray4
        button.alpha = 0
        button.addTarget(self, action: #selector(cancelAnimationButton), for: .touchUpInside)
        return button
    }()

    // Создаю UIImage для полноразмернного открытия фотографий
    private let fullImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "original1"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutConstraints()
        setupCollectionView()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }

    //MARK: - Setup Collection View
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        view.addSubview(collectionView)
        view.addSubview(blackView)
        view.addSubview(buttonCancelAnimation)
        view.addSubview(fullImageView)


        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            fullImageView.heightAnchor.constraint(equalTo: fullImageView.widthAnchor, multiplier: 1),

            buttonCancelAnimation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            buttonCancelAnimation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            buttonCancelAnimation.widthAnchor.constraint(equalToConstant: 40),
            buttonCancelAnimation.heightAnchor.constraint(equalTo: buttonCancelAnimation.widthAnchor, multiplier: 1)

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
       navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance()
       navigationController?.toolbar.backgroundColor = UIColor(named: "backgroundColor")
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
        cell.buttonAllPhotoCellDelegate = self
        cell.collectionImageView.image = UIImage(named: photoGallery[indexPath.item].image)
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
// MARK: - PhotoCellDelegate

extension PhotosViewController: PhotoCellDelegate {
    func tapAction(photo: UIImage) {
        self.fullImageView.image = photo
        self.fullImageView.isUserInteractionEnabled = true
        self.navigationController?.isNavigationBarHidden = true

        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {

            self.blackView.layer.opacity = 0.8
            self.fullImageView.layer.opacity = 1
            self.view.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
                self.buttonCancelAnimation.layer.opacity = 1
            }
        }
    }

    @objc func cancelAnimationButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.buttonCancelAnimation.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.blackView.layer.opacity = 0.0
                self.fullImageView.layer.opacity = 0
                self.navigationController?.isNavigationBarHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }
}
