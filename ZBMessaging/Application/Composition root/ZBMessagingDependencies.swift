//
//  ZBMessagingDependencies.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 8/3/2023.
//

import Foundation
import UIKit

class ZBMessagingDependencies {
    
    var window: UIWindow?
    private init(){
        
    }
    
    static let shared = ZBMessagingDependencies()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    internal func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    public func start() {
        
        let isLoggedIn:Bool = true
        
        if isLoggedIn {
            setRootViewController(LoginScreenVC())
        } else {
            
        }

    }
    
    func makeLoginViewController() -> UIViewController {
        let viewController = LoginScreenVC()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "Login"
        navigationController.tabBarController?.tabBar.tintColor = .red
        return navigationController
    }
    
}
