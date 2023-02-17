//
//  UIViewControllerExtension.swift
//  ZBMessaging
//
//  Created by Anwar Hajji on 14/02/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: false)
        }
    }
    
    func showOrHideLoader(done: Bool, closure:@escaping () -> Void) {
        if done {
            DispatchQueue.main.async {
                self.dismiss(animated: false, completion: {
                    closure()
                })
            }
        } else {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
