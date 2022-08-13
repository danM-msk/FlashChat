//  Created by Daniyar Mamadov on 13.08.2022.

import UIKit

final internal class MessageCell: UITableViewCell {
    
    static let identifier = "MessageTableViewCellID"

    
    internal var isMyMessage = false
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 4
        view.backgroundColor = isMyMessage ? .blue : .systemGray6
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var messageLabel: UILabel = {
        let view = UILabel()
        view.textColor = isMyMessage ? .white : .black
        view.textAlignment = .left
        return view
    }()
    
    internal let timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.textAlignment = .right
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
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(messageLabel)
        horizontalStackView.addArrangedSubview(timeLabel)
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -40),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
