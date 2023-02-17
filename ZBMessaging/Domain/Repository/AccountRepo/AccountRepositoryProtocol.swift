//
//  AccountRepositoryProtocol.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation


protocol AccountRepositoryProtocol: AccountRepositoryOutputProtocol {
    func login(_ identifier: String,_ password: String) async
}

protocol AccountRepositoryOutputProtocol {
    var onSuccessLogin: Published<Bool>.Publisher {get}
    var OnFailureLogin: Published<String>.Publisher {get}
}
