    //  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

class StartViewController: UIViewController {
    
    private let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoLabel: UILabel = {
        let view = UILabel()
        view.text = "⚡️FlashChat"
        view.textColor = .white
        view.font = .systemFont(ofSize: 36, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        getButton(title: "Register",
                  textColor: .blue,
                  backgroundColor: .white)
    }()
    
    private lazy var loginButton: UIButton = {
        getButton(title: "Log In",
                  textColor: .white,
                  backgroundColor: .blue)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientBackground()
        configureUI()
    }
    
    private func makeGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.74, green: 0.31, blue: 0.61, alpha: 1.00).cgColor,
                                UIColor(red: 0.97, green: 0.03, blue: 0.35, alpha: 1.00).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.backgroundColor = .clear
    }
    
    private func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView,
              arrangedSubview: logoLabel, registerButton, loginButton)
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
    
    private func getButton(title: String, textColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(textColor, for: .normal)
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.titleLabel?.textColor = textColor
        view.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return view
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        let inputVC = InputViewController(isLoginScreen: sender.currentTitle == "Log In")
        inputVC.modalTransitionStyle = .crossDissolve
        inputVC.modalPresentationStyle = .fullScreen
        present(inputVC, animated: true, completion: nil)
    }
}

