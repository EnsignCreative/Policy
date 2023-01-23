//
//  BioProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

protocol BioViewController: UIViewController {
    var presenter: BioPresentable? { get set }
    func setRequirements()
}



protocol BioRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> BioController
    func pushController(withData data: Any?)
}

protocol BioPresentable {
    var view: BioController? { get set }
    var router: BioRoutable? { get set }
    var interactor: BioInteractable? { get set }
    
    func pushController(withData data: Any?)
    func checkAvailablity(for username: String?, _ completion: @escaping ((String?) -> Void))
}


protocol BioInteractable {
    var presenter: BioPresentable? { get set }
    func checkAvailablity(for username: String?, _ completion: @escaping ((String?) -> Void))
}






extension BioViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}
