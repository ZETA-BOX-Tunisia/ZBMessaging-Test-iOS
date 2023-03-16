//
//  MessagesViewControllerViewModel.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 15/3/2023.
//

import Foundation

class MessagesViewControllerViewModel {
    
    private var messagesUseCase: MessagesUseCaseProtocol
    
    init(messagesUseCase: MessagesUseCaseProtocol) {
        self.messagesUseCase = messagesUseCase
    }
    
}
