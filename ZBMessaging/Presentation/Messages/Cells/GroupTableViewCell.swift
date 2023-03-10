//
//  GroupTableViewCell.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet var avatar1Image: UIImageView!
    @IBOutlet var avatar2Image: UIImageView!
    @IBOutlet var membersImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bodyMessageLabel: UILabel!
    @IBOutlet var statusImage1: UIImageView!
    @IBOutlet var statusImage2: UIImageView!
    
    static var cellIdentifier = "GroupTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
