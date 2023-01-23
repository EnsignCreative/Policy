//
//  AccountRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class AccountRouter: Routable, AccountRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "AccountController") as! AccountController
        let router: AccountRoutable = AccountRouter()
        var presenter: AccountPresentable = AccountPresenter()
        var interacter: AccountInteractable = AccountInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushTo(_ page: AccountReference, withData data: Any?) {
        let controller = EditorRouter.createViewController()
        controller.title = page.title
        navigationController?.pushViewController(controller, animated: true)
    }
}
