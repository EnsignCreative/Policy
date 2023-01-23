//
//  SignUpPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

class SignUpPresenter: SignUpPresentable {
    var view: SignUpController?
    var router: SignUpRoutable?
    var interactor: SignUpInteractable?

    func pushController(withData data: Any?) {
        router?.pushController(withData: data)
    }
}


// To Interactor
extension SignUpPresenter {
    func saveLoginInformation() {
        interactor?.saveLoginInformation()
    }
    func signUpWithApple(_ completion: @escaping ((Any?) -> Void)) {
        interactor?.signUpWithApple({ sender in
            completion(sender) })
    }
    func signUpWithGoogle(_ completion: @escaping ((Any?) -> Void)) {
        interactor?.signUpWithGoogle({ sender in
            completion(sender) })
    }

    func signUp(withEmail email: String?, password pass: String?, confirmation confirm: String?,
                                                                  _ completion: @escaping ((Any?) -> Void)) {
        interactor?.signUp(withEmail: email, password: pass, confirmation: confirm, { sender in
            completion(sender) })
    }
}
