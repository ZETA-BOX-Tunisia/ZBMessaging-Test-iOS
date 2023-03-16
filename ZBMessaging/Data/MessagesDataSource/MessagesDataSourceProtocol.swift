//
//  MessagesDataSourceProtocol.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 16/3/2023.
//

import Foundation
import ZBFramework

protocol MessagesDataSourceProtocol {
    
    func getContactList(start: Int?, limit: Int?, completion: @escaping ((_ data: [ZBFramework.UsersPermissionsUser]?, _ error: Error?) -> Void))
}
