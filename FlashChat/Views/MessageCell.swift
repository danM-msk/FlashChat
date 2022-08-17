//  Created by Daniyar Mamadov on 13.08.2022.

import UIKit

final internal class MessageCell: UITableViewCell {
    
    static let identifier = "MessageTableViewCellID"
    
    private let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.textAlignment = .right
        view.numberOfLines = 1
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .clear
        setup(subview: bubbleView, messageLabel, timeLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            bubbleView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: -40),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 4),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -4),
            
            timeLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 4),
            timeLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -4),
            timeLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -4)
        ])

    }
    
    internal func configureCell(isMyMessage: Bool, message: String, time: String) {
        messageLabel.text = message
        timeLabel.text = time
        
        if isMyMessage {
            bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
            bubbleView.backgroundColor = .blue
            messageLabel.textColor = .white
        } else {
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        }
    }
    
    private func setup(subview: UIView...) {
        subview.forEach {
            addSubview($0)
        }
    }
}
