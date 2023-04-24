//
//  MessagesViewControllerViewModel.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 15/3/2023.
//

import Foundation
import Combine
import ZBFramework

protocol MessagesViewmodelInput {
    func excuteAction()
}

protocol MessagesViewmodelOutput {
    var onFailure: Published<String>.Publisher {get}
    var onSuccess: Published<[ZBFramework.UsersPermissionsUser]>.Publisher {get}
}

protocol MessagesViewModelProtocol: MessagesViewmodelInput, MessagesViewmodelOutput {}



class MessagesViewControllerViewModel: MessagesViewModelProtocol {
   
    @Published var wrappedcontactlist = [ZBFramework.UsersPermissionsUser]()
    
    @Published var wrappedOnFailure: String = String()
    
    var onSuccess: Published<[ZBFramework.UsersPermissionsUser]>.Publisher { $wrappedcontactlist}
    
    var onFailure: Published<String>.Publisher { $wrappedOnFailure }
    
    
    private var messagesUseCase: MessagesUseCaseProtocol
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(messagesUseCase: MessagesUseCaseProtocol) {
        self.messagesUseCase = messagesUseCase
        self.observeResponse()
    }
    
    private func observeResponse() {
        subscriptions = [onSuccessObservation()]
    }
    
    private func onSuccessObservation() -> AnyCancellable {
        return messagesUseCase.contactList.sink { [weak self] conacts in
            guard let StrongSelf = self else { return }
            StrongSelf.wrappedcontactlist = conacts
        }
    }
    
    
    func excuteAction() {
        Task {
            await
            self.messagesUseCase.execute(start: 1, limit: 10)
        }
        
    }
}
