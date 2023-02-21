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
        let image = UIImageView()
        image.image = UIImage(named: "ava")
        image.layer.cornerRadius = 55
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        image.layer.borderWidth = 3
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //MARK: - Add Title Label
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Minions"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Status Label
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add Text Field
    private lazy var statusTextField: UITextField = {
        let textFild = UITextField()
        textFild.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textFild.textColor = .black
        textFild.placeholder = "Enter new status"
        textFild.layer.cornerRadius = 12
        textFild.font = .systemFont(ofSize: 15, weight: .regular)
        textFild.textAlignment = .center
        textFild.layer.borderWidth = 1
        textFild.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        textFild.delegate = self
        textFild.translatesAutoresizingMaskIntoConstraints = false
        textFild.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        return textFild
    }()

    //MARK: - Add Status Buttom
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5695073605, blue: 1, alpha: 1)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSizeMake(4.0, 4.0)
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(self, action: #selector(avatarButtomAction), for: .touchDown)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayoutConstraints()
        addTap()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Action Avatar Buttom
    @objc private func avatarButtomAction(selector: UIButton) {
        statusLabel.text = statusText
    }

    //MARK: - Action Text Field
    @objc private func textFieldAction(_ textField:  UITextField) {
        if textField.text?.isEmpty != nil {
            statusText = textField.text!
        }
    }

    //MARK: - Remove Keyboard
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tap)

    }
    //MARK: - Action Remove Keyboard
    @objc private func hideKeyboard() {
        endEditing(true)
    }

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        addSubview(avatarImage)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)

        NSLayoutConstraint.activate([

            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 110),
            avatarImage.heightAnchor.constraint(equalToConstant: 110),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 14),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 17),
            fullNameLabel.widthAnchor.constraint(equalToConstant: fullNameLabel.intrinsicContentSize.width),

            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -7),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: statusLabel.intrinsicContentSize.width),

            statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 43),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 43),
        ])
    }
}
//MARK: - Blocking Set Status Button if there is no text
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        setStatusButton.isEnabled = !text.isEmpty
    }

    //MARK: - Remove The Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
