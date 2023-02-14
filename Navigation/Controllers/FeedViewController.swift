//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private let postTitle = Post(text: "PostStrucTitle")

    //MARK: - Add Button Go to post
    private lazy var postButton: CradientButton = {
        var button = CradientButton(frame: CGRectMake(0, 0, 250, 40))
        button.setTitle("Go to post", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.shadowColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        button.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.4666666667, blue: 0.3960784314, alpha: 1)
        title = "Feed"
        setupView()
        setupConstraints()
    }

    //MARK: - Action Button Go to post
    @objc func actionPostButton() {
        let postVC = PostViewController()
        postVC.title = postTitle.text
        navigationController?.pushViewController(postVC, animated: true)
    }

    //MARK: - Setup Views
    private func setupView() {
        view.addSubview(postButton)
    }

    //MARK: - Setup Constraints
    private func setupConstraints() {

        NSLayoutConstraint.activate([

            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            postButton.widthAnchor.constraint(equalToConstant: 250),
            postButton.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
}

