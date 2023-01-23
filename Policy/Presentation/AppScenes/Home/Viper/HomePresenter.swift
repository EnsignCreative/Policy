//
//  HomePresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

class HomePresenter: HomePresentable {
    var view: HomeController?
    var router: HomeRoutable?
    var interactor: HomeInteractable?

    func pushTo(_ controller: HomeNavigation, withData data: Any?, using navigation: UINavigationController?) {
        router?.pushTo(controller, withData: data, using: navigation)
    }
}


// To Interactor
extension HomePresenter {

    
}
