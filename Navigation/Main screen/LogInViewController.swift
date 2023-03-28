//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр on 16.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default
    private let login = ""
    private let password = ""

    //MARK: - Scroll View
    private lazy var scrollView: UIScrollView = {
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

    //MARK: - Add StackView
    private lazy var stackView: UIStackView = {
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

    //MARK: - Email Text Fild
    private lazy var emailTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textFild.textColor = UIColor(named: "labelColor")
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor(named: "textFildBackgroundColor")
        textFild.placeholder = "Введите Email"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    //MARK: - Password Text Fild
    private lazy var passwordTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.layer.borderWidth = 0.5
        textFild.layer.cornerRadius = 10
        textFild.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textFild.textColor = UIColor(named: "labelColor")
        textFild.font = .systemFont(ofSize: 16)
        textFild.clearButtonMode = .whileEditing
        textFild.backgroundColor = UIColor(named: "textFildBackgroundColor")
        textFild.placeholder = "Введите Password"
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.autocapitalizationType = .none
        textFild.isSecureTextEntry = true
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    //MARK: - Login Button
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionloginButton), for: .touchUpInside)
        return button
    }()

    //MARK: - Add AlertLabel
    private lazy var alertLabel: UILabel = {
        let labelAlert = UILabel()
        labelAlert.translatesAutoresizingMaskIntoConstraints = false
        labelAlert.text = "Password должен содержать не менее 8 символов"
        labelAlert.textColor = .red
        labelAlert.isHidden = true
        labelAlert.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return labelAlert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupLayout()
        emailTextFild.delegate = self
        passwordTextFild.delegate = self
        hideKeyboardTapped()
    }

    //MARK: - Keyboard Observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //MARK: - Unsubscribe From Observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //MARK: - Keyboard Display
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }

    //MARK: - Hiding the Keyboard
    @objc private func keyboardWillHide() {
        scrollView.contentOffset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    //MARK: - IsValidPassword
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,64}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }

    //MARK: - IsValidEmail
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @objc private func actionloginButton () {
        if emailTextFild.text == "" && passwordTextFild.text == "" {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animation, forKey: "position")
            emailTextFild.attributedPlaceholder = NSAttributedString(string: emailTextFild.placeholder ?? "",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: passwordTextFild.placeholder ?? "",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }  else {
            stackView.layer.removeAnimation(forKey: "position")

        }

        if emailTextFild.text != "" && passwordTextFild.text == "" {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animation, forKey: "position")
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: passwordTextFild.placeholder ?? "",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

        // Проверка на валидацию email
        if isValidEmail(emailTextFild.text!) == false && emailTextFild.text != ""  {
            emailTextFild.text = ""
            emailTextFild.attributedPlaceholder = NSAttributedString(string: " Не корректно введен Email",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

        // Проверка на введеный email
        if isValidPassword(passwordTextFild.text!) && emailTextFild.text == ""  {
            emailTextFild.text = ""
            emailTextFild.attributedPlaceholder = NSAttributedString(string: " Не введен Email",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

        // Проверка на количество введенных символов
        if passwordTextFild.text!.count < 8 && passwordTextFild.text != "" {
            alertLabel.text = alertLabel.text
            alertLabel.isHidden = false

        } else {
            alertLabel.isHidden = true
        }

        if isValidEmail(emailTextFild.text!) && isValidPassword(passwordTextFild.text!) {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)

        } else if emailTextFild.text != "" && passwordTextFild.text != "" {
            let alert = UIAlertController(title: nil, message: "Вы ввели не верный логин или пароль", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Попробовать еще раз", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }

        // Проверка на валидацию password
        if isValidPassword(passwordTextFild.text!) == false && passwordTextFild.text != ""  {
            passwordTextFild.text = ""
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: " Не корректно введен Password",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }

    //MARK: - SetupLayout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(loginButton)
        contentView.addSubview(alertLabel)
        stackView.addArrangedSubview(emailTextFild)
        stackView.addArrangedSubview(passwordTextFild)


        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 3),
            alertLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

//MARK: - Extension UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {

    //MARK: - Keyboard Processing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    //MARK: - Hide Keyboard
    func hideKeyboardTapped() {
        let press: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        press.cancelsTouchesInView = false
        view.addGestureRecognizer(press)
    }

    //MARK: - Remove Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

