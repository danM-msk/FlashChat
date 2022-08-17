//  Created by Daniyar Mamadov on 17.08.2022.

import UIKit
import FirebaseAuth

final internal class LoginViewController: UIViewController {
    
    private let layout = UILayout()
    
    private lazy var verticalStackView: UIStackView = {
        layout.getStackView(axis: .vertical,
                            distribution: .fillEqually,
                            spacing: 20)
    }()
    
    private lazy var emailTextField: UITextField = {
        layout.getTextField(placeholder: "Email", isPassword: false)
    }()
    
    private lazy var passwordTextField: UITextField = {
        layout.getTextField(placeholder: "Password", isPassword: true)
    }()
    
    private lazy var loginButton: UIButton = {
        layout.getButton(title: "Log In",
                         titleColor: .white,
                         backgroundColor: .blue,
                         target: self,
                         action: #selector(loginButtonTapped))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "1@2.com"
        passwordTextField.text = "12345678"
        
        title = "Log In"
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .systemGray6
        configureUI()
        setupConstraints()
    }
    
    private func configureUI() {
        layout.setup(view: view,
                     subview: verticalStackView)
        layout.setup(stackView: verticalStackView,
                     arrangedSubview: emailTextField, passwordTextField, loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func loginButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let err = error {
                    self.layout.showAlert(viewController: self, message: err.localizedDescription)
                } else {
                    let chatVC = ChatViewController()
                    self.navigationController?.pushViewController(chatVC, animated: true)
                }
            }
        } else {
            layout.showAlert(viewController: self, message: "Email or password must contain characters.")
        }
    }
}
