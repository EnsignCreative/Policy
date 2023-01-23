//
//  InterestsRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

class InterestsRouter: InterestsRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> InterestsController {
        
        let storyboard = UIStoryboard(name: "StagingMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "InterestsController") as! InterestsController
        let router: InterestsRoutable = InterestsRouter()
        var presenter: InterestsPresentable = InterestsPresenter()
        var interacter: InterestsInteractable = InterestsInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushController(withData data: Any?) {
        let controller = SettingsRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
