//
//  SignInPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

class SignInPresenter: SignInPresentable {
    var view: SignInController?
    var router: SignInRoutable?
    var interactor: SignInInteractable?

    func pushHomeController(withData data: Any?) {
        router?.pushHomeController(withData: data)
    }
    func pushSignUpController(withData data: Any?) {
        router?.pushSignUpController(withData: data)
    }
}


// To Interactor
extension SignInPresenter {
    func saveLoginInformation() {
        interactor?.saveLoginInformation()
    }
    func signInWithApple(_ completion: @escaping ((Any?) -> Void)) {
        interactor?.signInWithApple({ sender in
            completion(sender) })
    }
    func signInWithGoogle(_ completion: @escaping ((Any?) -> Void)) {
        interactor?.signInWithGoogle({ sender in
            completion(sender) })
    }
    func forgotPassword(for email: String?, _ completion: @escaping ((Any?) -> Void)) {
        interactor?.forgotPassword(for: email, { sender in
            completion(sender) })
    }
    func signIn(withEmail email: String?, andPassword password: String?, _ completion: @escaping ((Any?) -> Void)) {
        interactor?.signIn(withEmail: email, andPassword: password, { sender in
            completion(sender) })
    }
}
