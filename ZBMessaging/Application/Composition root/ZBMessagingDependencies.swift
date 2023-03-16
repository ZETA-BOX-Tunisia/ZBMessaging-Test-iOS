//
//  ZBMessagingDependencies.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 8/3/2023.
//

import Foundation
import UIKit
import Combine
import ZBFramework

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
        let isLoggedIn = ZBEnvironementManager.accountManager.isConnected
        if isLoggedIn {
            setRootViewController(makeMessagesViewController())
        } else {
            setRootViewController(makeLoginViewController())
        }

    }
    
    /// Create LoginViewController
    /// - Returns: UIViewController
    func makeLoginViewController() -> UIViewController {
        let router = LoginRouter()
        let viewController = LoginScreenVC(router: router)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "Login"
        router.navigationController = navigationController
        return navigationController
    }
    
    func makeMessagesViewController() -> UIViewController {
        let messageDataSourceImpl = MessagesDataSourceImpl()
        let messageRepositoryImpl = MessagesRepositoryImpl(messagesRepositoryProtocol: messageDataSourceImpl)
        let messageUseCaseImpl = MessageUseCaseImpl(messagesRepositoryProtocol: messageRepositoryImpl)
        let viewModel = MessagesViewControllerViewModel(messagesUseCase: messageUseCaseImpl)
        let viewController = MessagesViewController(viewModel: viewModel)
        return viewController
    }
 
}
