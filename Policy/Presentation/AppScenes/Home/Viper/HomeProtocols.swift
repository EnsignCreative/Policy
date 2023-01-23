//
//  HomeProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit


protocol HomeViewController {
    var presenter: HomePresentable? { get set }
}


protocol HomeRoutable {
    static func createViewController() -> HomeController
    func pushTo(_ controller: HomeNavigation, withData data: Any?, using navigation: UINavigationController?)
}


protocol HomePresentable {
    var view: HomeController? { get set }
    var router: HomeRoutable? { get set }
    var interactor: HomeInteractable? { get set }

    func pushTo(_ controller: HomeNavigation, withData data: Any?, using navigation: UINavigationController?)
}


protocol HomeInteractable {
    var presenter: HomePresentable? { get set }
}


enum HomeNavigation: String {
    case profile = "ProfileController"
    
    var identifier: String { return rawValue }
}
