//
//  HelpProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol HelpViewController: UIViewController {
    var presenter: HelpPresentable? { get set }
    
    func setRequirements()
}


protocol HelpRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushController(to controller: SettingsPageReference, withData data: Any?)
}

protocol HelpPresentable {
    var view: HelpController? { get set }
    var router: HelpRoutable? { get set }
    var interactor: HelpInteractable? { get set }
    
    func pushController(to controller: SettingsPageReference, withData data: Any?)
}


protocol HelpInteractable {
    var presenter: HelpPresentable? { get set }
}










extension HelpViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}
