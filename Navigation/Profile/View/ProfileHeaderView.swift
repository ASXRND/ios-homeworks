//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 08.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {

    private var statusText: String = ""

    //MARK: - Add Avatar Image
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "ava")
        avatarImage.layer.cornerRadius = 55
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        avatarImage.layer.borderWidth = 3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()

    //MARK: - Add Title Label
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Hipster Minions"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    //MARK: - Add Waiting Label
    private lazy var waitingLabel: UILabel = {
        let waitingLabel = UILabel()
        waitingLabel.text = "Waiting for something"
        waitingLabel.textColor = .gray
        waitingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        waitingLabel.translatesAutoresizingMaskIntoConstraints = false
        return waitingLabel
    }()

    //MARK: - Add Avatar Buttom
    private lazy var avatarButtom: UIButton = {
        let avatarButtom = UIButton(type: .system)
        avatarButtom.setTitle("Show status", for: .normal)
        avatarButtom.backgroundColor = #colorLiteral(red: 0, green: 0.5695073605, blue: 1, alpha: 1)
        avatarButtom.tintColor = .white
        avatarButtom.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        avatarButtom.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        avatarButtom.layer.shadowOpacity = 0.7
        avatarButtom.layer.shadowOffset = CGSizeMake(4.0, 4.0)
        avatarButtom.layer.cornerRadius = 14
        avatarButtom.translatesAutoresizingMaskIntoConstraints = false
        avatarButtom.addTarget(self, action: #selector(avatarButtomAction), for: .touchDown)
        return avatarButtom
    }()

    //MARK: - Add Text Field
    private lazy var myTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        myTextField.textColor = .black
        myTextField.placeholder = "Enter new status"
        myTextField.layer.cornerRadius = 12
        myTextField.font = .systemFont(ofSize: 15, weight: .regular)
        myTextField.textAlignment = .center
        myTextField.layer.borderWidth = 1
        myTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        myTextField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        return myTextField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Action Avatar Buttom
    @objc func avatarButtomAction(selector: UIButton) {
        waitingLabel.text = statusText

    }

    //MARK: - Action Text Field
    @objc func textFieldAction(_ textField:  UITextField) {
        if textField.text?.isEmpty != nil {
            statusText = textField.text!
        }
    }

    //MARK: - Setup View
    private func setupView() {
        addSubview(avatarImage)
        addSubview(avatarButtom)
        addSubview(titleLabel)
        addSubview(waitingLabel)
        addSubview(myTextField)
    }

    //MARK: - Setup Constraints
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 110),
            avatarImage.heightAnchor.constraint(equalToConstant: 110),

            titleLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 17),

            waitingLabel.bottomAnchor.constraint(equalTo: myTextField.topAnchor, constant: -7),
            waitingLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 17),

            avatarButtom.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 43),
            avatarButtom.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarButtom.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            avatarButtom.heightAnchor.constraint(equalToConstant: 50),

            myTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            myTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            myTextField.bottomAnchor.constraint(equalTo: avatarButtom.topAnchor, constant: -16),
            myTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
