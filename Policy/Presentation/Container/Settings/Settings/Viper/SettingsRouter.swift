//
//  SettingsRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class SettingsRouter: Routable, SettingsRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
        let router: SettingsRoutable = SettingsRouter()
        var presenter: SettingsPresentable = SettingsPresenter()
        var interacter: SettingsInteractable = SettingsInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushTo(_ page: SettingsPageReference, withData data: Any?) {
        let controller = page.router.createViewController()
        controller.title = page.title
        navigationController?.pushViewController(controller, animated: true)
    }
}
