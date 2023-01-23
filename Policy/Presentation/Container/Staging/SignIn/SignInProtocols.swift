//
//  SignInProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//


import UIKit


protocol SignInViewController: UIViewController {
    var presenter: SignInPresentable? { get set }
    
    func setRequirements()
}


protocol SignInRoutable {
    static func createViewController() -> SignInController
    var navigationController: UINavigationController? { get set }
    
    func pushHomeController(withData data: Any?)
    func pushSignUpController(withData data: Any?)
}


protocol SignInPresentable {
    var view: SignInController? { get set }
    var router: SignInRoutable? { get set }
    var interactor: SignInInteractable? { get set }
    
    func saveLoginInformation()
    func signInWithApple(_ completion: @escaping ((Any?) -> Void))
    func signInWithGoogle(_ completion: @escaping ((Any?) -> Void))
    func forgotPassword(for email: String?, _ completion: @escaping ((Any?) -> Void))
    func signIn(withEmail email: String?, andPassword password: String?, _ completion: @escaping ((Any?) -> Void))
    
    func pushHomeController(withData data: Any?)
    func pushSignUpController(withData data: Any?)
}


protocol SignInInteractable {
    var presenter: SignInPresentable? { get set }
    
    func saveLoginInformation()
    func signInWithApple(_ completion: @escaping ((Any?) -> Void))
    func signInWithGoogle(_ completion: @escaping ((Any?) -> Void))
    func forgotPassword(for email: String?, _ completion: @escaping ((Any?) -> Void))
    func signIn(withEmail email: String?, andPassword password: String?, _ completion: @escaping ((Any?) -> Void))
}






extension SignInViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}


struct SignInModel {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

