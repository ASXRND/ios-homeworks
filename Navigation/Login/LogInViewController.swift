//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр on 16.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let loginView = LogInView()
    private let notification = NotificationCenter.default

    private let login = ""
    private let password = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        hideNavigationBar()
    }

    override func loadView() {
        super.loadView()
        view = loginView
        loginView.loginButton.addTarget(self, action: #selector(actionloginButton), for: .touchUpInside)
    }

    //MARK: - IsValidEmail
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    //MARK: - Action Login Button Show ProfileViewController
    @objc func actionloginButton() {
        if loginView.emailTextFild.text == "" || loginView.passwordTextFild.text == "" {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: loginView.stackView.center.x - 10, y: loginView.stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: loginView.stackView.center.x + 10, y: loginView.stackView.center.y))
            loginView.stackView.layer.add(animation, forKey: "position")
            loginView.emailTextFild.attributedPlaceholder = NSAttributedString(string:
                                                                                loginView.passwordTextFild.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            loginView.passwordTextFild.attributedPlaceholder =
            NSAttributedString(string: loginView.passwordTextFild.placeholder ?? "",
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])

        }  else {
            loginView.stackView.layer.removeAnimation(forKey: "position")

        }

        if isValidEmail(loginView.emailTextFild.text!) == false && loginView.emailTextFild.text != ""  {
            loginView.emailTextFild.text = ""
            loginView.emailTextFild.attributedPlaceholder = NSAttributedString(string: "Email is incorrect",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        if loginView.passwordTextFild.text!.count < 8 && loginView.passwordTextFild.text != "" {
            loginView.alertLabel.text = loginView.alertLabel.text
            loginView.alertLabel.isHidden = false

        } else {
            loginView.alertLabel.isHidden = true
        }

        if loginView.emailTextFild.text == login && loginView.passwordTextFild.text == password {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)

        } else if loginView.emailTextFild.text != "" && loginView.passwordTextFild.text != ""  {
            let alert = UIAlertController(title: "Неверные данные", message: "Вы ввели неверный логин или пароль, попробуйте снова", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Попробовать еще раз", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }

    }

    //MARK: - Keyboard Observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Unsubscribe From Observers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    //MARK: - Keyboard Display
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginView.scrollView.contentInset.bottom = keybordSize.height
            loginView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }

    //MARK: - Hiding the Keyboard
    @objc private func keyboardWillHide() {
        loginView.scrollView.contentInset = .zero
        loginView.scrollView.verticalScrollIndicatorInsets = .zero
    }
}

//MARK: - Hide Navigation Bar
extension LogInViewController {
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
