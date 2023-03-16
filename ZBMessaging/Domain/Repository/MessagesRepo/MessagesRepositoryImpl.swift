//
//  MessagesRepositoryImpl.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 16/3/2023.
//

import Foundation


class MessagesRepositoryImpl: MessagesRepositoryProtocol {
    
    private let messagesDataSourceProtocol: MessagesDataSourceProtocol
    
    init(messagesRepositoryProtocol: MessagesDataSourceProtocol){
        self.messagesDataSourceProtocol = messagesRepositoryProtocol
    }
    
}
