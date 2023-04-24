//
//  LoginResponseData.swift
//  ZBMessaging
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation

struct LoginResponseData {
    
    var done: Bool?
    var error: Error?
}


struct MessageRequestModel {
    var threadId: Int
    var start: Int?
    var limit: Int?
}


struct Message {
    var name: String
    var body: String
}

struct Group {
    var name: String
    var body: String
}
