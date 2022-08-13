//  Created by Daniyar Mamadov on 14.08.2022.

import Foundation

final internal class DummyData {
    let chat: [Message] = [Message(isMyMessage: true, message: "Hi!", time: "11:00"),
                           Message(isMyMessage: true, message: "Как дела?", time: "11:01"),
                           Message(isMyMessage: false, message: "Привет! Нормально", time: "11:02"),
                           Message(isMyMessage: false, message: "У тебя как?", time: "11:03"),
                           Message(isMyMessage: true, message: "пнх", time: "11:04"),
                           Message(isMyMessage: false, message: "ты чорт", time: "11:05"),
                           Message(isMyMessage: false, message: "Dummy Data sucks", time: "11:06"),
                           Message(isMyMessage: true, message: "Lorem ipsum dolor sit amet. Qui voluptatibus dolores ex vero cumque qui provident consectetur sed tempore omnis sed exercitationem similique et fugiat repellendus! Sit nulla ipsum ut repudiandae assumenda eum sint dignissimos. Nam temporibus dolorum est commodi exercitationem ex ipsa odit sed tempora provident.", time: "11:07"),
                           Message(isMyMessage: false, message: "Lorem ipsum dolor sit amet. Qui voluptatibus dolores ex vero cumque qui provident consectetur sed tempore omnis sed exercitationem similique et fugiat repellendus! Sit nulla ipsum ut repudiandae assumenda eum sint dignissimos. Nam temporibus dolorum est commodi exercitationem ex ipsa odit sed tempora provident.", time: "11:08"),
                           Message(isMyMessage: true, message: "все", time: "11:09")]
}
