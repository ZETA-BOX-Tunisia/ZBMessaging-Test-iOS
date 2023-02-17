//
//  BindingTextField.swift
//  ZBMessaging
//
//  Created by Anwar Hajji on 14/02/2023.
//

import Foundation
import UIKit


class BindingTextField : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        self.textChanged(textField.text!)
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

