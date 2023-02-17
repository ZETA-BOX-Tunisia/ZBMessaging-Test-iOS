//
//  LoginUseCaseImpl.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation
import Combine
 
class LoginUseCaseImpl: LoginUseCaseProtocol {
    
    @Published private var wrappedonSuccessLogin: Bool = false
    var onSuccessLogin: Published<Bool>.Publisher { $wrappedonSuccessLogin}
    
    @Published private var wrappedOnFailureLogin: String = ""
    var OnFailureLogin: Published<String>.Publisher { $wrappedOnFailureLogin}
    
    private var subsriptions = Set<AnyCancellable>()
    private let accountRepositoryProtocol: AccountRepositoryProtocol
    
    init(accountRepositoryProtocol: AccountRepositoryProtocol){
        self.accountRepositoryProtocol = accountRepositoryProtocol
        ObserveLoginResponse()
    }
    
    func excute(_ identifier: String, _ password: String) async {
        await self.accountRepositoryProtocol.login(identifier, password)
    }
    
    private func ObserveLoginResponse() {
        subsriptions = [onFailureResponseSubsribtion(), onSuccessResponseSubsribtion()]
    }
    
    private func onFailureResponseSubsribtion() -> AnyCancellable {
        return accountRepositoryProtocol.OnFailureLogin.sink {[weak self] onfailure in
            guard let StrongSelf = self else {return}
            StrongSelf.wrappedOnFailureLogin = onfailure
        }
    }
    
    private func onSuccessResponseSubsribtion() -> AnyCancellable {
        return accountRepositoryProtocol.onSuccessLogin.sink {[weak self] onSucess in
            guard let StrongSelf = self else {return}
            StrongSelf.wrappedonSuccessLogin = onSucess
        }
    }
    
}
