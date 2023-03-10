//
//  MessageTableViewCell.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    // outlets
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bodyMessageLabel: UILabel!
    @IBOutlet var deliveryImage: UIImageView!
    
    @IBOutlet var statusImge: UIImageView!
    
    static var cellIdentifier = "MessageTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
