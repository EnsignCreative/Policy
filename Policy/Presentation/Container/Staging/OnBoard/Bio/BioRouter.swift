//
//  BioRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class BioRouter: BioRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> BioController {
        
        let storyboard = UIStoryboard(name: "StagingMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "BioController") as! BioController
        let router: BioRoutable = BioRouter()
        var presenter: BioPresentable = BioPresenter()
        var interacter: BioInteractable = BioInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushController(withData data: Any?) {
        let controller = PictureRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

