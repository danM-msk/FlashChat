//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class InputViewController: UIViewController {
    
    private let layout = Layout()
    
    private var isLoginScreen: Bool
    
    private let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var usernameTextField: UITextField = {
        getTextField(placeholder: "Username", isPassword: false)
    }()
    
    private lazy var passwordTextField: UITextField = {
        getTextField(placeholder: "Password", isPassword: true)
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton()
        let title = isLoginScreen ? "Log In" : "Register"
        view.setTitle(title, for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return view
    }()
    
    init(isLoginScreen: Bool) {
        self.isLoginScreen = isLoginScreen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        title = isLoginScreen ? "Log In with existing user" : "Create new user"
        view.backgroundColor = .systemGray6
        configureUI()
    }
    
    private func getTextField(placeholder: String, isPassword: Bool) -> UITextField {
        let view = UITextField()
        view.placeholder = placeholder
        view.clearButtonMode = .whileEditing
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .next
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.isSecureTextEntry = isLoginScreen && isPassword
        return view
    }
    
    @objc private func nextButtonTapped() {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
        if !isLoginScreen {
            registerNewUser()
        }
    }
    
    private func registerNewUser() {
        print("REGISTERED NEW USER")
    }
    
    private func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView,
              arrangedSubview: usernameTextField, passwordTextField, nextButton)
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
