//
//  LoginViewModel.swift
//  ZBMessaging
//
//  Created by MRhimi on 17/2/2023.
//

import Foundation
import Combine
import UIKit

import Foundation

struct BrokenRule {
    var propertyName :BrokenRulesEnum
}

enum BrokenRulesEnum {
    case emptyField
}


protocol LoginViewModelInput {
    func excuteAction()
    func validate()
    var isValid: Bool {get set}
    var identifierValue: Dynamic<String> {get set}
    var passwordValue: Dynamic<String> {get set}
}

protocol LoginViewModelOutput {
    var onFailure: Published<String>.Publisher {get}
    var onSuccess: Published<Bool>.Publisher {get}
    var inProgress: Published<Bool>.Publisher {get}
}


protocol LoginViewModelProtocol: LoginViewModelInput, LoginViewModelOutput {}

class LoginViewModel: NSObject, LoginViewModelProtocol {
    
    var isValid: Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.validate()
            return self.brokenRules.count == 0 ? true : false
        }
        set {
            
        }
    }
    
    var brokenRules: [BrokenRule] = []
    
    var identifierValue = Dynamic<String>("")
    
    var passwordValue = Dynamic<String>("")
    
    @Published var wrappedInProgress: Bool = false
    @Published var wrappedonSuccess: Bool = false
    @Published var wrappedOnFailure: String = String()
    
    var inProgress: Published<Bool>.Publisher { $wrappedInProgress }
    var onSuccess: Published<Bool>.Publisher { $wrappedonSuccess }
    var onFailure: Published<String>.Publisher { $wrappedOnFailure }
    
    private var loginUseCase: LoginUseCaseProtocol
    
    private var subsriptions = Set<AnyCancellable>()
    
    init(loginUseCase: LoginUseCaseProtocol){
        self.loginUseCase = loginUseCase
        super.init()
        self.observeResponse()
    }
    
    private func observeResponse() {
        subsriptions = [onSuccessObservation(), onFailureObservation()]
    }
    
    private func onSuccessObservation() -> AnyCancellable {
        return loginUseCase.onSuccessLogin.sink {[weak self] onSuccess in
            guard let StrongSelf = self else {return}
            StrongSelf.wrappedonSuccess = onSuccess
        }
    }
    
    private func onFailureObservation() -> AnyCancellable {
        return loginUseCase.OnFailureLogin.sink {[weak self] onFailure in
            guard let StrongSelf = self else {return}
            StrongSelf.wrappedOnFailure = onFailure
        }
    }
    
    func excuteAction() {
        Task {
            wrappedInProgress = true
            await self.loginUseCase.excute(self.identifierValue.value ?? "", self.passwordValue.value ?? "")
        }
    }
    
    func validate() {
        guard let identifierValue = identifierValue.value, identifierValue.isEmpty == false else {
            let brokenRule = BrokenRule(propertyName: .emptyField)
            self.brokenRules.append(brokenRule)
            return
        }
    }
    
}
