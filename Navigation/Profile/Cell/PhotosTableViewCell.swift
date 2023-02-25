//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    //MARK: - Add Author Label
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Author Label
    private lazy var arrowLabel: UIButton = {
        let button = UIButton()
        button.image = .init(systemName: "arrow.forward")

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Add Image View
    private lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


}
