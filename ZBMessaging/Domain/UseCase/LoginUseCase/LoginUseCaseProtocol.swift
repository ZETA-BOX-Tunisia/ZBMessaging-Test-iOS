//
//  LoginUseCaseProtocol.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation

protocol LoginUseCaseProtocol: LoginUseCaseProtocolOutput {
    func excute(_ identifier: String,_ password: String) async
}

protocol LoginUseCaseProtocolOutput {
    var onSuccessLogin: Published<Bool>.Publisher {get}
    var OnFailureLogin: Published<String>.Publisher {get}
}
