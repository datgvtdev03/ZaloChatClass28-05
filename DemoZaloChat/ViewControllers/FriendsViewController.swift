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
    
    @IBOutlet weak var lblKhongTimThay: UILabel!
    
    
    var friends: [User] = []
    var fitterData: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        fitterData = friends
        tblFriends.dataSource = self
        tblFriends.delegate = self
        searchBar.delegate = self
        lblKhongTimThay.isHidden = true

        
    }
    
    func initData() {
        let friend1 = User(id: 1, fullName: "Nguyễn Mạnh Linh", avatar: "avt1", phone: "01233", password: "", friends: [])
        let friend2 = User(id: 2, fullName: "Phạm Thảo", avatar: "avt2", phone: "01244", password: "", friends: [])
        let friend3 = User(id: 3, fullName: "Thu Minnnnn", avatar: "avt3", phone: "014444", password: "", friends: [])
        let friend4 = User(id: 4, fullName: "Nguyễn Khắc Hùng", avatar: "avt4", phone: "01288", password: "", friends: [])
        let friend5 = User(id: 5, fullName: "Đinh Tiên Hoàng", avatar: "avt5", phone: "01299", password: "", friends: [])
        let friend6 = User(id: 6, fullName: "Vũ Thị Quỳnh", avatar: "avt6", phone: "014455", password: "", friends: [])
        
        friends.append(friend1)
        friends.append(friend2)
        friends.append(friend3)
        friends.append(friend4)
        friends.append(friend5)
        friends.append(friend6)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fitterData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier:"FriendCellIdentifier")!
        let lblFriendsName = cell.viewWithTag(103) as! UILabel
        lblFriendsName.text = fitterData[indexPath.row].fullName
        let imageAvatarFriends = cell.viewWithTag(106) as!UIImageView
        imageAvatarFriends.image = UIImage(named: fitterData[indexPath.row].avatar)
        imageAvatarFriends.layer.cornerRadius = 35
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        fitterData.remove(at: indexPath.row)
        tblFriends.reloadData()
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
        if fitterData.count == 0 {
            lblKhongTimThay.isHidden = false
            tblFriends.isHidden = true
        }else {
            lblKhongTimThay.isHidden = true
            tblFriends.isHidden = false
        }
        tblFriends.reloadData()
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
