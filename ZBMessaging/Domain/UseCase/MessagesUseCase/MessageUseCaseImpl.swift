//
//  MessageUseCaseImpl.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 15/3/2023.
//

import Foundation

class MessageUseCaseImpl: MessagesUseCaseProtocol {
    
    
    private let messagesRepositoryProtocol: MessagesRepositoryProtocol

    init(messagesRepositoryProtocol: MessagesRepositoryProtocol){
        self.messagesRepositoryProtocol = messagesRepositoryProtocol
    }
}



