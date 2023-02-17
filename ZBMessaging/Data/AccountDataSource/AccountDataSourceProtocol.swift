//
//  AccountDataSource.swift
//  ZBMessagingExample
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation


protocol AccountDataSourceProtocol {
    func login(_ identifier: String,_ password: String, completion: @escaping (Bool, Error?) -> Void)
}
