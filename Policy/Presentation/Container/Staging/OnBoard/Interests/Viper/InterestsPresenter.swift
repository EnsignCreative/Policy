//
//  InterestsPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

class InterestsPresenter: InterestsPresentable {
    var view: InterestsController?
    var router: InterestsRoutable?
    var interactor: InterestsInteractable?
    
    func pushController(withData data: Any?) {
        router?.pushController(withData: data)
    }
}

