//
//  AccountDataSourceImp.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation
import ZBFramework

class AccountDataSourceImpl: AccountDataSourceProtocol {
    
    func login(_ identifier: String, _ password: String, completion: @escaping (Bool, Error?) -> Void) {
        ZBEnvironementManager.accountManager.login(identifier, password) { done, error in
            completion(done, error)
        }
        
        
    }
    
}
