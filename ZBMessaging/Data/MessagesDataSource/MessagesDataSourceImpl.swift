//
//  MessagesDataSourceImpl.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 16/3/2023.
//

import Foundation
import ZBFramework


class MessagesDataSourceImpl: MessagesDataSourceProtocol {
    
    func getContactList(start: Int?, limit: Int?, completion: @escaping (([ZBFramework.UsersPermissionsUser]?, Error?) -> Void)) {
        ZBEnvironementManager.contactManager.getContactList(start: 1, limit: 10) { data, error in
            completion(data, error)
        }
    }
}
