//
//  MessageModel.swift
//  DemoZaloChat
//
//  Created by VanHuy on 2023-05-22.
//

import Foundation
class Message {
    var id: Int = 0
    var content: String = ""
    var senderID: Int = 0
    var conversationID: Int = 0
    var time: String = ""
    var status: String = ""
    
    init(id: Int, content: String, senderID: Int, conversationID: Int, time: String, status: String) {
        self.id = id
        self.content = content
        self.senderID = senderID
        self.conversationID = conversationID
        self.time = time
        self.status = status
    }
}
