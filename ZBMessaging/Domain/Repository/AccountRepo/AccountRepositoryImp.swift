//
//  AccountRepositoryImp.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation
import UIKit

class AccountRepositoryImpl: AccountRepositoryProtocol {
    
    @Published private var wrappedonSuccessLogin: Bool = false
    var onSuccessLogin: Published<Bool>.Publisher { $wrappedonSuccessLogin}
    
    @Published private var wrappedOnFailureLogin: String = ""
    var OnFailureLogin: Published<String>.Publisher { $wrappedOnFailureLogin}
    
    private let accountDataSourceProtocol: AccountDataSourceProtocol
    
    init(accountDataSourceProtocol: AccountDataSourceProtocol){
        self.accountDataSourceProtocol = accountDataSourceProtocol
    }
    
    func login(_ identifier: String, _ password: String) async {
        self.accountDataSourceProtocol.login(identifier, password) {[weak self] done, error in
            guard let StrongSelf = self else {return}
            if let error = error {
                StrongSelf.wrappedOnFailureLogin = error.localizedDescription
            } else if done {
                StrongSelf.wrappedonSuccessLogin = true
            }
        }
    }
    
}
