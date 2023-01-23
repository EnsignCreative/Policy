//
//  HelpController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class HelpRouter: Routable, HelpRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HelpController") as! HelpController
        let router: HelpRoutable = HelpRouter()
        var presenter: HelpPresentable = HelpPresenter()
        var interacter: HelpInteractable = HelpInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushController(to controller: SettingsPageReference, withData data: Any?) {

    }
}
