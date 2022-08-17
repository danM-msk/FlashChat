//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit
import FirebaseAuth

final internal class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let layout = UILayout()
    
    internal let dummyData = DummyData()
    
    private let chatTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        layout.getStackView(axis: .horizontal, distribution: .fill, spacing: 10)
    }()
    
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
        view.setImage(UIImage(named: "SendIcon")?.withTintColor(.blue), for: .normal)
        view.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureUI()
        setupConstaints()
        configureNavigationBar()
        configureChatTableView()
        configureBackground()
    }
    
    @objc private func sendButtonTapped() {
        print("SEND MESSAGE")
    }
    
    private func configureUI() {
        layout.setup(view: view, subview: chatTableView, horizontalStackView)
        layout.setup(stackView: horizontalStackView, arrangedSubview: messageTextField, sendButton)
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: -10),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureChatTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.backgroundColor = .red
        chatTableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        chatTableView.estimatedRowHeight = 60
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorStyle = .none
    }
    
    private func configureNavigationBar() {
        title = "Chat"
        let logoutButton = UIBarButtonItem(title: "Log Out",
                                           style: .done,
                                   target: self,
                                   action: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = logoutButton
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configureBackground() {
        if let backgroundImage = UIImage(named: "ChatBackground") {
            chatTableView.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            chatTableView.backgroundColor = .white
        }
    }
    
    @objc private func logOutButtonTapped() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            layout.showAlert(viewController: self, message: signOutError.localizedDescription)
        }
    }
}
