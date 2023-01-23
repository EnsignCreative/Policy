//
//  BioPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class BioPresenter: BioPresentable {
    var view: BioController?
    var router: BioRoutable?
    var interactor: BioInteractable?
    
    func pushController(withData data: Any?) {
        router?.pushController(withData: data)
    }
    
    func checkAvailablity(for username: String?, _ completion: @escaping ((String?) -> Void)) {
        interactor?.checkAvailablity(for: username, { sender in
            completion(sender)
        })
    }
}

