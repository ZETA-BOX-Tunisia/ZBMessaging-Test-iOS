//
//  MessagesRepositoryImpl.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 16/3/2023.
//

import Foundation
import ZBFramework

class MessagesRepositoryImpl: MessagesRepositoryProtocol {
    
    @Published var wrappedcontactlist = [ZBFramework.UsersPermissionsUser]()
    
    var contactList: Published<[ZBFramework.UsersPermissionsUser]>.Publisher {
        $wrappedcontactlist
    }
    
    
    private let messagesDataSourceProtocol: MessagesDataSourceProtocol
    
    init(messagesRepositoryProtocol: MessagesDataSourceProtocol){
        self.messagesDataSourceProtocol = messagesRepositoryProtocol
    }
    
    
    func getContactList(start: Int?, limit: Int?) async {
        self.messagesDataSourceProtocol.getContactList(start: 1, limit: 10) { [weak self] data, error in
            guard let StrongSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
            } else {
                StrongSelf.wrappedcontactlist = data ?? []
            }
        }
    }
}
