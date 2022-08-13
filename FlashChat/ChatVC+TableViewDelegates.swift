//  Created by Daniyar Mamadov on 14.08.2022.

import UIKit

extension ChatViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else { return UITableViewCell() }
        cell.isMyMessage = dummyData.chat[indexPath.row].isMyMessage
        cell.messageLabel.text = dummyData.chat[indexPath.row].message
        cell.timeLabel.text = dummyData.chat[indexPath.row].time
        return cell
    }
}
