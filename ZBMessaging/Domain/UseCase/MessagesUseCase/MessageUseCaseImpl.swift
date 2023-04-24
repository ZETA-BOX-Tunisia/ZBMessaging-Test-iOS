//
//  MessageUseCaseImpl.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 15/3/2023.
//

import Foundation
import Combine
import ZBFramework

class MessageUseCaseImpl: MessagesUseCaseProtocol {
    
    
    @Published var wrappedcontactlist = [ZBFramework.UsersPermissionsUser]()
    
    var contactList: Published<[ZBFramework.UsersPermissionsUser]>.Publisher {
        $wrappedcontactlist
    }
    
    private var subsriptions = Set<AnyCancellable>()
    
    private let messagesRepositoryProtocol: MessagesRepositoryProtocol

    init(messagesRepositoryProtocol: MessagesRepositoryProtocol){
        self.messagesRepositoryProtocol = messagesRepositoryProtocol
        self.ObserveMessagesResponse()
    }
    
    func execute(start: Int?, limit: Int?) async {
        await self.messagesRepositoryProtocol.getContactList(start: 1, limit: 10)
    }
    
    private func ObserveMessagesResponse() {
        subsriptions = [onSuccessContactsResponseSubscribtion()]
    }
    
    private func onSuccessContactsResponseSubscribtion() -> AnyCancellable {
        return messagesRepositoryProtocol.contactList.sink { [weak self] conacts in
            guard let StrongSelf = self else { return }
            StrongSelf.wrappedcontactlist = conacts
        }
    }
}



