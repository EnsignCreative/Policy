//
//  SecurityRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit


class SecurityRouter: Routable, SecurityRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SecurityController") as! SecurityController
        let router: SecurityRoutable = SecurityRouter()
        var presenter: SecurityPresentable = SecurityPresenter()
        var interacter: SecurityInteractable = SecurityInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    

    func pushTo(_ page: SecurityReference, withData data: Any?) {
        let controller = EditorRouter.createViewController()
        controller.title = page.rawValue
        navigationController?.pushViewController(controller, animated: true)
    }
}
