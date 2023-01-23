//
//  SecurityPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//


import UIKit

class SecurityPresenter: SecurityPresentable {
    var view: SecurityController?
    var router: SecurityRoutable?
    var interactor: SecurityInteractable?
    
    func pushTo(_ page: SecurityReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}
