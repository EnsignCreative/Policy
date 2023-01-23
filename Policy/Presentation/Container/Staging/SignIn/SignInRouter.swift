//
//  SignInRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//


import UIKit

class SignInRouter: SignInRoutable {
    
    var navigationController: UINavigationController?
    
    static func createViewController() -> SignInController {
    
        let storyboard = UIStoryboard(name: "StagingMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignInController") as! SignInController
        let presenter = SignInPresenter()
        let router: SignInRoutable = SignInRouter()
        var interacter: SignInInteractable = SignInInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func pushSignUpController(withData data: Any?) {
        let controller = SignUpRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func pushHomeController(withData data: Any?) {
        let controller = HomeRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
