//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александр on 17.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var modelStar = Modelstar(author: "", image: "", likes: 1, views: 1, description: "")

    //MARK: - Add Author Label
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Image View
    private lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Add Description Label
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "descriptionColor")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Likes Label
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()

    //MARK: - Add Views Label
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "backgroundColor")
        setupLayoutConstraints()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - SetupGestures
    private func setupGestures() {
        let tapLikeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likesLabel.addGestureRecognizer(tapLikeLabelGesture)


    }

    // MARK: - LikeAction
    @objc private func likeAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {

            self.modelStar.likes += 1
            self.likesLabel.text = "Likes \(self.modelStar.likes)"
        }
    }

    //MARK: - Setup Cell
    func setupCell(model: Modelstar) {
        modelStar = model
        authorLabel.text = model.author
        myImageView.image = UIImage(named: model.image)
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
        descriptionLabel.text = model.description
    }

    let screenWidth = UIScreen.main.bounds.width

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        contentView.addSubview(authorLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)

        let inset: CGFloat = 16

        NSLayoutConstraint.activate([

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            myImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: inset),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: screenWidth),

            descriptionLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)

        ])
    }
}
