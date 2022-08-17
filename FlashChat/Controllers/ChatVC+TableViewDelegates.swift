//  Created by Daniyar Mamadov on 14.08.2022.

import UIKit

extension ChatViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else { return UITableViewCell() }
        let cellData = dummyData.chat[indexPath.row]
        cell.configureCell(isMyMessage: cellData.isMyMessage,
                           message: cellData.message,
                           time: cellData.time)
        return cell
    }
}
