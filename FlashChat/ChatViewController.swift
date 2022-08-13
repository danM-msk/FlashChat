//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    internal let dummyData = DummyData()
    
    private let chatTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private let horizontalStackView: UIStackView = {
//        let view = UIStackView()
//        view.axis = .horizontal
//        view.distribution = .fillProportionally
//        view.spacing = 10
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let messageTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Message"
        view.clearButtonMode = .never
        view.autocapitalizationType = .sentences
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .send
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.isSecureTextEntry = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sendButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "SendIcon.png")?.withTintColor(.red), for: .normal)
        view.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        view.backgroundColor = .systemGray6
        configureUI()
        configureChatTableView()
    }
    
    @objc private func sendButtonTapped() {
        print("SEND MESSAGE")
    }
    
    private func setup(subview: UIView...) {
        subview.forEach {
            view.addSubview($0)
        }
    }
    
    private func configureUI() {
        setup(subview: chatTableView, messageTextField, sendButton)
//        view.addSubview(horizontalStackView)
//        horizontalStackView.addArrangedSubview(messageTextField)
//        horizontalStackView.addArrangedSubview(sendButton)
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -10),
            
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 30),
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureChatTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
    }
}
