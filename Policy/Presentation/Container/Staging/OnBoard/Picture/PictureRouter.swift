//
//  PictureRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

class PictureRouter: PictureRoutable {
    var navigationController: UINavigationController?

    static func createViewController() -> PictureController {
        
        let storyboard = UIStoryboard(name: "StagingMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PictureController") as! PictureController
        let router: PictureRoutable = PictureRouter()
        var presenter: PicturePresentable = PicturePresenter()
        var interacter: PictureInteractable = PictureInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interacter
        interacter.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushController(withData data: Any?) {
        let controller = InterestsRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
