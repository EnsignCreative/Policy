//
//  DocumentProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol DocumentViewController: UIViewController {
    var presenter: DocumentPresentable? { get set }
    
    func setRequirements()
}

protocol DocumentRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}

protocol DocumentPresentable {
    var view: DocumentController? { get set }
    var router: DocumentRoutable? { get set }
    var interactor: DocumentInteractable? { get set }
    
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}


protocol DocumentInteractable {
    var presenter: DocumentPresentable? { get set }
}





extension DocumentViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}


