//
//  MessagesCellController.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import Foundation
import UIKit

class MessagesCellController: CellConroller {
    private var model: Message
    
    init(model: Message) {
        self.model = model
    }
    static func configure(tableView: UITableView) {
        tableView.register(MessageTableViewCell.nib, forCellReuseIdentifier: MessageTableViewCell.cellIdentifier)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.cellIdentifier, for: indexPath) as! MessageTableViewCell
//            cell.configCell(item: model)
        return cell
    }
}

