//
//  ConversationViewController.swift
//  DemoZaloChat
//
//  Created by VanHuy on 2023-05-23.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tblConversation: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var conversation: [Conversation] = []
    let avatars = ["avt2", "avt3", "avt6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tblConversation.delegate = self
        tblConversation.dataSource = self
        
        
    }
    
    func initData(){
        
        var messagesOfConversation1: [Message] = []
        let messages1OfConversation1 = Message(id: 1, content: "Hi cả lớp, tối nay đi học đúng giờ nhé", senderID: 1, conversationID: 1, time: "16h00", status: "Đã gửi")
        let messages2OfConversation1 = Message(id: 2, content: "Cả lớp nộp bài tập đúng giờ nhé", senderID: 2, conversationID: 1, time: "16h30", status: "Đã gửi")
        let messages3OfConversation1 = Message(id: 3, content: "Hihii", senderID: 3, conversationID: 1, time: "22h30", status: "Đã gửi")
        messagesOfConversation1.append(messages1OfConversation1)
        messagesOfConversation1.append(messages2OfConversation1)
        messagesOfConversation1.append(messages3OfConversation1)
        
        var messagesOfConversation2: [Message] = []
        let messages1OfConversation2 = Message(id: 4, content: "Hi bạn", senderID: 1, conversationID: 2, time: "16h00", status: "Đã gửi")
        let messages2OfConversation2 = Message(id: 2, content: "Bạn đang làm gì vậy", senderID: 2, conversationID: 2, time: "16h30", status: "Đã gửi")
        let messages3OfConversation2 = Message(id: 3, content: "Tối đi chơi nha", senderID: 1, conversationID: 2, time: "22h30", status: "Đã gửi")
        messagesOfConversation2.append(messages1OfConversation2)
        messagesOfConversation2.append(messages2OfConversation2)
        messagesOfConversation2.append(messages3OfConversation2)
        
        let conversation1 = Conversation(id: 1, name: "K17-VietDevelopers", members: [],messages: messagesOfConversation1, managers: [])
        let conversation2 = Conversation(id: 2, name: "Phuonggt1", members: [],messages: messagesOfConversation2, managers: [])
        let conversation3 = Conversation(id: 3, name: "Gia đình", members: [],messages: messagesOfConversation1, managers: [])
        conversation.append(conversation1)
        conversation.append(conversation2)
        conversation.append(conversation3)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messagesConversationVC = self.storyboard?.instantiateViewController(withIdentifier: "ConversationMessageViewController") as! ConversationMessageViewController
        // khoi tao ra man hinh messagesConversationVC
//        hien thi ten cuoc hoi thoai
        messagesConversationVC.conversationName = conversation[indexPath.row].name
        messagesConversationVC.messages = conversation[indexPath.row].messages

//        // do du lieu mang messages cua man hinh messagesConversationVC = du lieu messages cua cuoc hoi thoai khi cham.(touch) vao
        show(messagesConversationVC, sender: self)
//        navigationController?.pushViewController(messagesConversationVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversation.dequeueReusableCell(withIdentifier:"ConversationCellIndentifier")!
        let lblConversationName = cell.viewWithTag(101) as! UILabel
        lblConversationName.text = conversation[indexPath.row].name
        
        let imageAvt = cell.viewWithTag(105) as! UIImageView
        imageAvt.image = UIImage(named: avatars[indexPath.row])
        imageAvt.layer.cornerRadius = 30
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
