//  Created by Daniyar Mamadov on 16.08.2022.

import UIKit
import FirebaseAuth

final internal class RegisterViewController: UIViewController {
    
    private let layout = UILayout()
    
    private lazy var verticalStackView: UIStackView = {
        layout.getStackView(axis: .vertical,
                            distribution: .fillEqually,
                            spacing:  20)
    }()
    
    private lazy var emailTextField: UITextField = {
        layout.getTextField(placeholder: "Email", isPassword: false)
    }()
    
    private lazy var passwordTextField: UITextField = {
        layout.getTextField(placeholder: "Password", isPassword: false)
    }()
    
    private lazy var registerButton: UIButton = {
        layout.getButton(title: "Register",
                         titleColor: .white,
                         backgroundColor: .blue,
                         target: self,
                         action: #selector(registerButtonTapped))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register new user"
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .systemGray6
        configureUI()
        setupConstraints()
    }
    
    private func configureUI() {
        layout.setup(view: view,
                     subview: verticalStackView)
        layout.setup(stackView: verticalStackView,
                     arrangedSubview: emailTextField, passwordTextField, registerButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func registerButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error {
                    self.layout.showAlert(viewController: self, message: err.localizedDescription)
                } else {
                    let chatVC = ChatViewController()
                    chatVC.modalTransitionStyle = .flipHorizontal
                    chatVC.modalPresentationStyle = .fullScreen
                    self.present(chatVC, animated: true)
                }
            }
        } else {
            layout.showAlert(viewController: self, message: "Email or password must contain characters.")
        }
    }
}
