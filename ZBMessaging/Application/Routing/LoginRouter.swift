//
//  LoginRouter.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 8/3/2023.
//

import Foundation
import UIKit

class LoginRouter: LoginRouting {
    
    var navigationController: UINavigationController?
    func routeToMessages() {
        let vc = ZBMessagingDependencies.shared.makeMessagesController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}

