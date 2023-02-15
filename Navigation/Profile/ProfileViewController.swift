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
        profileView.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8392156863, alpha: 1)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9625412822, green: 0.9625412822, blue: 0.9625412822, alpha: 1)
        title = "Profile"
        setupView()
    }
}

//MARK: - Add Constraints
extension ProfileViewController {
    
    internal override func viewWillLayoutSubviews() {
        
        NSLayoutConstraint.activate([
            
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            profileView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}

//MARK: - Setup View
extension ProfileViewController {
    
    private func setupView() {
        view.addSubview(profileView)
    }
}

