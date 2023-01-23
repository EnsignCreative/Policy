//
//  AccountPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class AccountPresenter: AccountPresentable {
    var view: AccountController?
    var router: AccountRoutable?
    var interactor: AccountInteractable?
    
    func pushTo(_ page: AccountReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}
