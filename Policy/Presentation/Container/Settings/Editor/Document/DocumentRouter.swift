//
//  DocumentRouter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class DocumentRouter: Routable, DocumentRoutable {
    var navigationController: UINavigationController?
    
    static func createViewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "SettingsMain", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DocumentController") as! DocumentController
        let router: DocumentRoutable = DocumentRouter()
        var presenter: DocumentPresentable = DocumentPresenter()
        var interacter: DocumentInteractable = DocumentInteractor()
        
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
