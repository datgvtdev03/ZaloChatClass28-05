//
//  UsersDatabase.swift
//  DemoZaloChat
//
//  Created by Thanh Dat on 30/05/2023.
//

import Foundation
class UsersDatabase {
    var usersDB: [User] = []
    
    init() {
        let userID1 = User(id: 1, fullName: "Phuonggt1", avatar: "avt1", phone: "011111", password: "", friends: [])
        let userID2 = User(id: 2, fullName: "Thảo Phạm", avatar: "avt2", phone: "0222222", password: "", friends: [])
        let userID3 = User(id: 3, fullName: "Thu Minnnn", avatar: "avt4", phone: "0333333", password: "", friends: [])
        let userID4 = User(id: 4, fullName: "Thu Mi", avatar: "avt2", phone: "111111", password: "", friends: [])
        
        
        self.usersDB.append(userID1)
        self.usersDB.append(userID2)
        self.usersDB.append(userID3)
        self.usersDB.append(userID4)
    }
    
    func getUserDetailByID(userID: Int) -> User? {
        for anUser in usersDB {
            if anUser.id == userID {
                return anUser
            }
        }
        return nil
    }
}
