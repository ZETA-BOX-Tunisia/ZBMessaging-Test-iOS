//
//  LoginScreen.swift
//  ZBMessaging
//
//  Created by MRhimi on 17/2/2023.
//

import Foundation
import Combine
import UIKit

class LoginScreenVC: UIViewController {


    @IBOutlet weak var identifierTxtField: BindingTextField! {
        didSet {
            self.identifierTxtField.bind(callback: {self.viewModel.identifierValue.value = $0 })
        }
    }
    @IBOutlet weak var passwordTextField: BindingTextField! {
        didSet {
            self.passwordTextField.bind(callback: {self.viewModel.passwordValue.value = $0 })
        }
    }
    @IBOutlet weak var nextBtn: UIButton!

    var viewModel = LoginViewModel(loginUseCase: LoginUseCaseImpl(accountRepositoryProtocol: AccountRepositoryImpl(accountDataSourceProtocol: AccountDataSourceImpl())))

    private var subsriptions = Set<AnyCancellable>()



    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

    }

    func initView() {
        nextBtn.layer.cornerRadius = 15
        identifierTxtField.setLeftPaddingPoints(10)
        passwordTextField.setLeftPaddingPoints(10)

        bindDataFromViewModel()

    }

    @IBAction func nextBtnDidTapped(_ sender: Any) {
        if viewModel.isValid == true {
            viewModel.excuteAction()
        } else {
            self.viewModel.brokenRules.map({$0.propertyName}).forEach({ BrokenRule in
                switch BrokenRule {
                case .emptyField:
                    showAlert(message: "Empty required field")
                }
            })
        }
    }

    private func bindDataFromViewModel() {
        subsriptions = [
                inProgressSubsribtion(),
                onSuccessSubscription(),
                onFailureSubscription()
            ]
        }

    private func inProgressSubsribtion() -> AnyCancellable {
        return viewModel.inProgress.sink {inProgress in
            DispatchQueue.main.async {
                if inProgress == true {
                    print("Loading")
                    self.showOrHideLoader(done: false) {
                    }
                }
            }
        }
    }

    private func onSuccessSubscription() -> AnyCancellable {
        return viewModel.onSuccess.sink {onSuccess in
            if onSuccess == true {
                DispatchQueue.main.async {
                    self.showOrHideLoader(done: true) {
                        self.showAlert(title: "Login successful", message: "Hello. Welcome to the app!")
                    }
                }
            }
        }
    }

    private func onFailureSubscription() -> AnyCancellable {
        return viewModel.onFailure.sink {onFailure in
            DispatchQueue.main.async {
                self.showOrHideLoader(done: true) {
                    if onFailure != "" {
                        self.showAlert(message: onFailure.description)
                    }
                }
            }
        }
    }

}
