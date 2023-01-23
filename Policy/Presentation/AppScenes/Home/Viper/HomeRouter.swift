//
//  HomeRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

class HomeRouter: HomeRoutable {
    static func createViewController() -> HomeController {
        
        let storyboard = UIStoryboard(name: "AppMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        
        let presenter = HomePresenter()
        let router: HomeRoutable = HomeRouter()
        var interacter: HomeInteractable = HomeInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushTo(_ controller: HomeNavigation, withData data: Any?, using navigation: UINavigationController?) {
        let storyboard = UIStoryboard(name: "AppMain", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controller.identifier)
        navigation?.pushViewController(controller, animated: true)
    }
}
