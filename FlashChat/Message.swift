//  Created by Daniyar Mamadov on 14.08.2022.

import Foundation

internal struct Message {
    let isMyMessage: Bool
    let message: String
    let time: String
    
    init(isMyMessage: Bool, message: String, time: String) {
        self.isMyMessage = isMyMessage
        self.message = message
        self.time = time
    }
}
