//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private let postTitle = Post(text: "PostStrucTitle")

    //MARK: - Add Stack View
    private let stackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.backgroundColor = #colorLiteral(red: 0.788644433, green: 0.8879172206, blue: 0.9848760962, alpha: 1)
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    //MARK: - Add Button Go to post
    private lazy var postButton: UIButton = {
        var postButton = UIButton()
        postButton.setTitle("Go to post", for: .normal)
        postButton.tintColor = .white
        postButton.backgroundColor = .blue
        postButton.layer.cornerRadius = 16
        postButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        postButton.layer.shadowColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
        postButton.layer.shadowOpacity = 0.7
        postButton.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        postButton.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()

    //MARK: - Add Button Go to post Two
    private lazy var twoPostButton: UIButton = {
        var TwoPostButton = UIButton()
        TwoPostButton.setTitle("Go to post", for: .normal)
        TwoPostButton.tintColor = .white
        TwoPostButton.backgroundColor = .blue
        TwoPostButton.layer.cornerRadius = 16
        TwoPostButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        TwoPostButton.layer.shadowColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
        TwoPostButton.layer.shadowOpacity = 0.7
        TwoPostButton.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        TwoPostButton.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        TwoPostButton.translatesAutoresizingMaskIntoConstraints = false
        return TwoPostButton
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
        view.addSubview(stackView)
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(twoPostButton)
    }

    //MARK: - Setup Constraints
    private func setupConstraints() {

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            postButton.widthAnchor.constraint(equalToConstant: 50),
            twoPostButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}

