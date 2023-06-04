//
//  ConversationMessageViewController.swift
//  DemoZaloChat
//
//  Created by VanHuy on 2023-05-23.
//

import UIKit

class ConversationMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var tblMessages: UITableView!
    
    @IBOutlet weak var textViewMessage: UITextField!
    @IBOutlet weak var lblNameChat: UILabel!
   
    var messages: [Message] = []
    var userDatabaseObject  = UsersDatabase()
    
    var conversationName: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMessages.dataSource = self
        tblMessages.delegate = self
        textViewMessage.delegate = self
        
        lblNameChat.text = conversationName
        
        
        
        //        Đăng ký file Xib vừa tạo
        
        tblMessages.register(UINib(nibName: "MessageByFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByFriendCellIdentifier")
        tblMessages.register(UINib(nibName: "MessageByLoggedInUserTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByLoggedInUserCellIdentifier")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let sender = userDatabaseObject.getUserDetailByID(userID: messages[indexPath.row].senderID) {
            if messages[indexPath.row].senderID == 1 {
                let messageCellByMe = tblMessages.dequeueReusableCell(withIdentifier: "MessageByLoggedInUserCellIdentifier") as! MessageByLoggedInUserTableViewCell
                messageCellByMe.lblMessageByLoggedInUser.text = messages[indexPath.row].content
                messageCellByMe.ImgAvatarLoggedInUser.image = UIImage(named: sender.avatar)
                return messageCellByMe
            }
            let messageCellByFriend = tblMessages.dequeueReusableCell(withIdentifier: "MessageByFriendCellIdentifier") as! MessageByFriendTableViewCell
            messageCellByFriend.lblMessageByFriend.text = messages[indexPath.row].content
            messageCellByFriend.lblFriendName.text = sender.fullName
            messageCellByFriend.ImgAvatarFriend.image = UIImage(named: sender.avatar)
            return messageCellByFriend
        } else {
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        messages.remove(at: indexPath.row)
        tblMessages.reloadData()
    }
    
    //ham nay bat su kien khi nhan nut enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textViewMessage {
            sendChatMessage()
            textViewMessage.text = ""
            return false
        }
        return true
    }

    func sendChatMessage() {
        if let content = textViewMessage.text {
            let message = Message(id: 1, content: content, senderID: 1, conversationID: 1, time: "", status: "")
            messages.append(message)
            tblMessages.reloadData()
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            tblMessages.scrollToRow(at: indexPath, at: .bottom, animated: true)
            textViewMessage.text = ""
        }
    }
    
    //        var cell = tblMessages.dequeueReusableCell(withIdentifier: "FriendMessageCellIdentifier")!
    //        if conversationDetail?.messages[indexPath.row].senderID == 1 {
    //            cell = tblMessages.dequeueReusableCell(withIdentifier: "LoggedInMesageICellldentifier")!
    //        }
    //            let lblMessage = cell.viewWithTag(102) as! UILabel
    //            lblMessage.text = conversationDetail?.messages[indexPath.row].content
    //            let imgAvtUsers = cell.viewWithTag(107) as! UIImageView
    //            imgAvtUsers.image = UIImage(named: avtUsers[indexPath.row])
    //            return cell
    //        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
