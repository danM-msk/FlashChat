//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class UILayout: NSObject {
    
    internal let firstGradientColor =  UIColor(red: 0.25, green: 0.37, blue: 0.98, alpha: 1.00)
    internal let secondGradientColor = UIColor(red: 0.99, green: 0.27, blue: 0.42, alpha: 1.00)
    
    internal func setup(view: UIView, subview: UIView...) {
        subview.forEach {
            view.addSubview($0)
        }
    }
    
    internal func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    internal func getStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let view = UIStackView()
        view.axis = axis
        view.distribution = distribution
        view.spacing = spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    internal func getTextField(placeholder: String, isPassword: Bool) -> UITextField {
        let view = UITextField()
        view.placeholder = placeholder
        view.clearButtonMode = .whileEditing
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .next
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.isSecureTextEntry = isPassword
        return view
    }
    
    internal func getButton(title: String, titleColor: UIColor, backgroundColor: UIColor, target: Any?, action: Selector) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(titleColor, for: .normal)
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        view.titleLabel?.textAlignment = .center
        view.addTarget(target, action: action, for: .touchUpInside)
        return view
    }
    
    internal func getLabel(text: String, textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = font
        view.textAlignment = textAlignment
        return view
    }
    
    internal func makeGradientBackground(forView: UIView, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = forView.bounds
        gradientLayer.colors = colors
        forView.layer.insertSublayer(gradientLayer, at: 0)
        forView.backgroundColor = .clear
    }
    
    internal func animateLabel(_ forLabel: UILabel, text: String) {
        for char in text.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(char.offset), repeats: false) { _ in
                forLabel.text?.append(char.element)
            }
        }
    }
    
    internal func showAlert(viewController: UIViewController, message: String?) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        viewController.present(alert, animated: true)
    }
}
