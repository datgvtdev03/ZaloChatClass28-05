//
//  MessageByFriendTableViewCell.swift
//  DemoZaloChat
//
//  Created by Thanh Dat on 29/05/2023.
//

import UIKit

class MessageByFriendTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lblMessageByFriend: UILabel!
    
    @IBOutlet weak var lblFriendName: UILabel!
    
    @IBOutlet weak var ImgAvatarFriend: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
