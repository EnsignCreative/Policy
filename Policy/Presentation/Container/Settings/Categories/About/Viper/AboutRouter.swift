//
//  AboutRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit


class AboutRouter: Routable, AboutRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "AboutController") as! AboutController
        let router: AboutRoutable = AboutRouter()
        var presenter: AboutPresentable = AboutPresenter()
        var interacter: AboutInteractable = AboutInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }

    func pushTo(_ page: AboutPageReference, withData data: Any?) {
        let controller = DocumentRouter.createViewController()
        controller.title = page.rawValue
        navigationController?.pushViewController(controller, animated: true)
    }
}
