//
//  EditorProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol EditorViewController: UIViewController {
    var presenter: EditorPresentable? { get set }
    
    func setRequirements()
}


protocol EditorRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}

protocol EditorPresentable {
    var view: EditorController? { get set }
    var router: EditorRoutable? { get set }
    var interactor: EditorInteractable? { get set }
    
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}


protocol EditorInteractable {
    var presenter: EditorPresentable? { get set }
}




extension EditorViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}


