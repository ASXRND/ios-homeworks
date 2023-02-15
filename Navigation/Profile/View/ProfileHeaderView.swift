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
        $0.image = UIImage(named: "ava")
        $0.layer.cornerRadius = 55
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        $0.layer.borderWidth = 3
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    //MARK: - Add Title Label
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Minions"
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()

    //MARK: - Add Waiting Label
    private lazy var statusLabel: UILabel = {
        $0.text = "Waiting for something"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    //MARK: - Add Avatar Buttom
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.backgroundColor = #colorLiteral(red: 0, green: 0.5695073605, blue: 1, alpha: 1)
        setStatusButton.tintColor = .white
        setStatusButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        setStatusButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowOffset = CGSizeMake(4.0, 4.0)
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.isEnabled = false
        setStatusButton.addTarget(self, action: #selector(avatarButtomAction), for: .touchDown)
        return setStatusButton
    }()

    //MARK: - Add Text Field
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        statusTextField.textColor = .black
        statusTextField.placeholder = "Enter new status"
        statusTextField.layer.cornerRadius = 12
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.textAlignment = .center
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        return statusTextField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        addTap()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Action Avatar Buttom
    @objc func avatarButtomAction(selector: UIButton) {
        statusLabel.text = statusText
    }

    //MARK: - Action Text Field
    @objc func textFieldAction(_ textField:  UITextField) {
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
    @objc func hideKeyboard() {
        endEditing(true)
    }

    //MARK: - Setup View
    private func setupView() {
        addSubview(avatarImage)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        statusTextField.delegate = self
    }

    //MARK: - Setup Constraints
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 110),
            avatarImage.heightAnchor.constraint(equalToConstant: 110),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 14),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 17),

            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -7),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: statusLabel.intrinsicContentSize.width),

            setStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 43),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
//MARK: - Blocking SetStatusButton if there is no text
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        setStatusButton.isEnabled = !text.isEmpty
    }
}
