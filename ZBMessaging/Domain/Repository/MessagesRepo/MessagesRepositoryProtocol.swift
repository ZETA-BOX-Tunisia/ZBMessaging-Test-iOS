//
//  MessagesRepositoryProtocol.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 16/3/2023.
//

import Foundation
import Combine
import ZBFramework

protocol MessagesRepositoryProtocol: MessagesRepositoryOutputProtocol {
    func getContactList(start: Int?, limit: Int?) async
}


protocol MessagesRepositoryOutputProtocol {
    var contactList: Published<[ZBFramework.UsersPermissionsUser]>.Publisher {get}
}
