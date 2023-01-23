//
//  SignUpRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

class SignUpRouter: SignUpRoutable {
    var navigationController: UINavigationController?

    static func createViewController() -> SignUpController {
        
        let storyboard = UIStoryboard(name: "StagingMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        let presenter = SignUpPresenter()
        let router: SignUpRoutable = SignUpRouter()
        var interacter: SignUpInteractable = SignUpInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushController(withData data: Any?) {
        let controller = BioRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
