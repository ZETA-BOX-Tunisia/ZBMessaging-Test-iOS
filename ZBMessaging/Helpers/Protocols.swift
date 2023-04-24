//
//  Protocols.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import Foundation
import UIKit

protocol CellConroller {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

extension CellConroller {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){ }
}



