//
//  SignUpProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//


import UIKit

protocol SignUpViewController: UIViewController {
    var presenter: SignUpPresentable? { get set }
    
    func setRequirements()
}



protocol SignUpRoutable {
    var navigationController: UINavigationController? { get set }
    
    func pushController(withData data: Any?)
    static func createViewController() -> SignUpController
}


protocol SignUpPresentable {
    var view: SignUpController? { get set }
    var router: SignUpRoutable? { get set }
    var interactor: SignUpInteractable? { get set }
    
    func saveLoginInformation()
    func pushController(withData data: Any?)
    func signUpWithApple(_ completion: @escaping ((Any?) -> Void))
    func signUpWithGoogle(_ completion: @escaping ((Any?) -> Void))
    func signUp(withEmail email: String?, password pass: String?, confirmation confirm: String?,
                                                                _ completion: @escaping ((Any?) -> Void))
}


protocol SignUpInteractable {
    var presenter: SignUpPresentable? { get set }
    
    func saveLoginInformation()
    func signUpWithApple(_ completion: @escaping ((Any?) -> Void))
    func signUpWithGoogle(_ completion: @escaping ((Any?) -> Void))
    func signUp(withEmail email: String?, password pass: String?, confirmation confirm: String?,
                                                                  _ completion: @escaping ((Any?) -> Void))
}




extension SignUpViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}
