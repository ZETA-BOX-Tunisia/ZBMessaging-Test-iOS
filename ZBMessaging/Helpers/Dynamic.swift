//
//  Dynamic.swift
//  ZBMessaging
//
//  Created by Anwar Hajji on 13/02/2023.
//

import Foundation

import Foundation

class Dynamic<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            if let value = value {
                bind(value)
            }
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}
