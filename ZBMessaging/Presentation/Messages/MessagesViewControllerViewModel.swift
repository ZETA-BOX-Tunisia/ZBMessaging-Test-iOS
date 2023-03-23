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
    
    
    func excuteAction() {
        Task {
            await
            self.messagesUseCase.execute(start: 1, limit: 10)
        }
        
    }
}
