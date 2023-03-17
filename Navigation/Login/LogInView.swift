//
//  LogInView.swift
//  Navigation
//
//  Created by Александр on 16.02.2023.
//

import UIKit

final class LogInView: UIView {

    //MARK: - Scroll View
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    //MARK: - Content View
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Logo Image View
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

     lazy var stackView: UIStackView = {
       let stackView = UIStackView()
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
       stackView.distribution = .fillEqually
       stackView.layer.cornerRadius = 10
       stackView.backgroundColor = .systemGray6
       stackView.layer.borderColor = UIColor.lightGray.cgColor
       stackView.layer.borderWidth = 0.5
       stackView.layer.masksToBounds = true
       return stackView
   }()

     lazy var alertLabel: UILabel = {
       let labelAlert = UILabel()
       labelAlert.translatesAutoresizingMaskIntoConstraints = false
       labelAlert.text = "Password cannot be less than 8 characters"
       labelAlert.textColor = .red
       labelAlert.isHidden = true
       labelAlert.font = UIFont.systemFont(ofSize: 12, weight: .medium)
       return labelAlert
   }()

    //MARK: - Email Text Fild
     lazy var emailTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textFild.textColor = UIColor(named: "labelColor")
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor(named: "backgroundColor")
        textFild.placeholder = "Email of phone"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    //MARK: - Password Text Fild
     lazy var passwordTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textFild.textColor = UIColor(named: "labelColor")
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor(named: "backgroundColor")
        textFild.placeholder = "Password"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.isSecureTextEntry = true
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    //MARK: - Login Button
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundColor")
        setupView()
        setupConstraints()
        addTap()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Setup View
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(emailTextFild)
        contentView.addSubview(passwordTextFild)
        contentView.addSubview(loginButton)
        contentView.addSubview(alertLabel)
        contentView.addSubview(stackView)
        stackView.addSubview(emailTextFild)
        stackView.addSubview(passwordTextFild)

        emailTextFild.delegate = self
        passwordTextFild.delegate = self
    }

    //MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            alertLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            alertLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor),

            emailTextFild.topAnchor.constraint(equalTo: stackView.topAnchor),
            emailTextFild.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailTextFild.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            emailTextFild.heightAnchor.constraint(equalToConstant: 50),

            passwordTextFild.topAnchor.constraint(equalTo: emailTextFild.bottomAnchor),
            passwordTextFild.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextFild.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordTextFild.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordTextFild.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - Extension UITextFieldDelegate
extension LogInView: UITextFieldDelegate {

    //MARK: - Keyboard Processing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
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
}
