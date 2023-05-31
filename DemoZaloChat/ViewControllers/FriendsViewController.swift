//
//  FriendsViewController.swift
//  DemoZaloChat
//
//  Created by Thanh Dat on 25/05/2023.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tblFriends: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friends: [User] = []
    var fitterData: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        fitterData = friends
        tblFriends.dataSource = self
        tblFriends.delegate = self
        
    }
    
    func initData() {
        let friend1 = User(id: 1, fullName: "Nguyễn Mạnh Linh", avatar: "avt1", phone: "01233", password: "", friends: [])
        let friend2 = User(id: 2, fullName: "Phạm Thảo", avatar: "avt2", phone: "01244", password: "", friends: [])
        let friend3 = User(id: 3, fullName: "Thu Minnnnn", avatar: "avt4", phone: "014444", password: "", friends: [])
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
        imageAvatarFriends.image = UIImage(named: friends[indexPath.row].avatar)
        imageAvatarFriends.layer.cornerRadius = 30
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fitterData = []
        if searchText == "" {
            fitterData = friends
        }
        for check in friends {
            if check.fullName.lowercased().contains(searchText.lowercased()){
                fitterData.append(check)
            }
        }
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
