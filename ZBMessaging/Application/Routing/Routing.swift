//
//  Routing.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 8/3/2023.
//

import Foundation
import UIKit

protocol Routing {
    var navigationController: UINavigationController? { set get }
}

protocol LoginRouting: Routing {
    func routeToMessages()
}

