//
//  MessagesUseCaseProtocol.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 15/3/2023.
//

import Foundation
import ZBFramework

protocol MessagesUseCaseProtocol: MessagesUseCaseProtocolOutput {
    
    func execute(start: Int?, limit: Int?) async
}

protocol MessagesUseCaseProtocolOutput {
    var contactList: Published<[ZBFramework.UsersPermissionsUser]>.Publisher {get}
}
