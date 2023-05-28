//
//  ConversationMessageViewController.swift
//  DemoZaloChat
//
//  Created by VanHuy on 2023-05-23.
//

import UIKit

class ConversationMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblMessages: UITableView!
    
    @IBOutlet weak var lblNameChat: UILabel!
    var conversationDetail: Conversation?
    let avtUsers = ["avt1", "avt2", "avt4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tblMessages.dataSource = self
        tblMessages.delegate = self
        lblNameChat.text = conversationDetail?.name
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (conversationDetail?.messages.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMessages.dequeueReusableCell(withIdentifier: "MessageCellIdentifier")!
        let lblMessage = cell.viewWithTag(102) as! UILabel
        lblMessage.text = conversationDetail?.messages[indexPath.row].content
        let imgAvtUsers = cell.viewWithTag(107) as! UIImageView
        imgAvtUsers.image = UIImage(named: avtUsers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
