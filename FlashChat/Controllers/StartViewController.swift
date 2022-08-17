    //  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

class StartViewController: UIViewController {
    
    private let layout = UILayout()
    
    private lazy var verticalStackView: UIStackView = {
        layout.getStackView(axis: .vertical,
                            distribution:  .fillEqually,
                            spacing:  20)
    }()
    
    private lazy var logoLabel: UILabel = {
        layout.getLabel(text: "",
                        textColor: .white,
                        font: .systemFont(ofSize: 36, weight: .black),
                        textAlignment: .center)
    }()
    
    private lazy var registerButton: UIButton = {
        layout.getButton(title: "Register",
                         titleColor: .blue,
                         backgroundColor: .white,
                         target: self,
                         action: #selector(buttonTapped(_:)))
    }()
    
    private lazy var loginButton: UIButton = {
        layout.getButton(title: "Log In",
                         titleColor: .white,
                         backgroundColor: .blue,
                         target: self,
                         action: #selector(buttonTapped(_:)))
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupConstraints()
        layout.makeGradientBackground(forView: view,
                                      colors: [layout.firstGradientColor.cgColor,
                                               layout.secondGradientColor.cgColor])
        layout.animateLabel(logoLabel, text: "⚡️FlashChat")
    }
    
    private func configureUI() {
        layout.setup(view: view,
                     subview: verticalStackView)
        layout.setup(stackView: verticalStackView,
                     arrangedSubview: logoLabel, registerButton, loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let nextVC = sender.currentTitle == "Log In" ? LoginViewController() : RegisterViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

