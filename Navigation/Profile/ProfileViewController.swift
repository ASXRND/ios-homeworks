//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    //MARK: - Add Sub View
    private lazy var profileView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        profileView.backgroundColor = .white
        return profileView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        setupView()
    }
}

//MARK: - Add Constraints
extension ProfileViewController {

    internal override func viewWillLayoutSubviews() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0),
        ])
    }
}

//MARK: - Setup View
extension ProfileViewController {

    private func setupView() {
        view.addSubview(profileView)
    }
}

