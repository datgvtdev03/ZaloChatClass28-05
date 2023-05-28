//
//  FriendsViewController.swift
//  DemoZaloChat
//
//  Created by Thanh Dat on 25/05/2023.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
   
    @IBOutlet weak var tblFriends: UITableView!
    var friends: [User] = []
    let avatarFriends = ["avt1", "avt2", "avt4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tblFriends.dataSource = self
        tblFriends.delegate = self
    }
    
    func initData() {
        let friend1 = User(id: 5, fullName: "Nguyễn Mạnh Linh", avatar: "avt1", phone: "01233", password: "1111", friends: [])
        let friend2 = User(id: 6, fullName: "Phạm Thảo", avatar: "avt2", phone: "01244", password: "22222", friends: [])
        let friend3 = User(id: 7, fullName: "Thu Min", avatar: "avt4", phone: "014444", password: "33333", friends: [])
        friends.append(friend1)
        friends.append(friend2)
        friends.append(friend3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier:"FriendCellIdentifier")!
        let lblFriendsName = cell.viewWithTag(103) as! UILabel
        lblFriendsName.text = friends[indexPath.row].fullName
        let imageAvatarFriends = cell.viewWithTag(106) as!UIImageView
        imageAvatarFriends.image = UIImage(named: avatarFriends[indexPath.row])
        imageAvatarFriends.layer.cornerRadius = 30
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
