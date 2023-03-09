//
//  GroupCellController.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import Foundation
import UIKit

class GroupCellController: CellConroller {
    private var group: Group
    
    init(group: Group) {
        self.group = group
    }
    static func configure(tableView: UITableView) {
        tableView.register(GroupTableViewCell.nib, forCellReuseIdentifier: GroupTableViewCell.cellIdentifier)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.cellIdentifier, for: indexPath) as! GroupTableViewCell
        cell.textLabel?.text = "Sunday BBQ"
//            cell.configCell(item: model)
        return cell
    }
}
