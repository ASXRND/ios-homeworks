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
        image.layer.cornerRadius = 50
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
        label.textColor = UIColor(named: "labelColor")
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
        textFild.backgroundColor = UIColor(named: "backgroundColor")
        textFild.textColor = UIColor(named: "labelColor")
        textFild.placeholder = "Enter new status"
        textFild.layer.cornerRadius = 12
        textFild.font = .systemFont(ofSize: 15, weight: .regular)
        textFild.textAlignment = .center
        textFild.clearButtonMode = .whileEditing
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
        button.backgroundColor = UIColor(named: "buttonBackgroundColor")
        button.setTitleColor(UIColor(named: "tintButtonColorHeader"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.shadowColor = UIColor(named: "shadowColor")?.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSizeMake(0.0, 4.0)
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(self, action: #selector(avatarButtomAction), for: .touchUpInside)
        return button
    }()

    private lazy var crossButton: UIButton = {
        let crossButton = UIButton()
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        crossButton.tintColor = #colorLiteral(red: 0, green: 0.5695073605, blue: 1, alpha: 1)
        crossButton.alpha = 0
        crossButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return crossButton
    }()

    private let blackView: UIView = {
        let viewBlack = UIView()
        viewBlack.translatesAutoresizingMaskIntoConstraints = false
        viewBlack.alpha = 0
        viewBlack.backgroundColor = .black
        viewBlack.frame = UIScreen.main.bounds
        return viewBlack
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundColor")
        setupLayoutConstraints()
        setupGesture()
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

    private var topImage = NSLayoutConstraint()
    private var leadingImage = NSLayoutConstraint()
    private var widthImage = NSLayoutConstraint()
    private var heightImage = NSLayoutConstraint()

    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        addSubview(avatarImage)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)

        let inset: CGFloat = 16

        topImage = avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        leadingImage = avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset)
        widthImage = avatarImage.widthAnchor.constraint(equalToConstant: 100)
        heightImage = avatarImage.heightAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([

            topImage, leadingImage, widthImage, heightImage,

            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 130),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: inset),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 43),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
    }


    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(tapGesture)
    }

    @objc private func actionTap() {
        addSubview(blackView)
        addSubview(crossButton)
        bringSubviewToFront(avatarImage)

        NSLayoutConstraint.activate([
            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.blackView.alpha = 0.8
            self.avatarImage.layer.cornerRadius = 10
            self.topImage.constant = 100
            self.leadingImage.constant = 0
            self.widthImage.constant = UIScreen.main.bounds.width
            self.heightImage.constant = UIScreen.main.bounds.width
            self.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.alpha = 1
            }
        }
    }

    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.crossButton.alpha = 0

        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.avatarImage.layer.cornerRadius = 50
                self.topImage.constant = 0
                self.leadingImage.constant = 16
                self.widthImage.constant = 100
                self.heightImage.constant = 100
                self.blackView.alpha = 0
                self.layoutIfNeeded()
            }
        }
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

