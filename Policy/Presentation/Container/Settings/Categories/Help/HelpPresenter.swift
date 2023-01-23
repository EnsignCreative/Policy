//
//  HelpPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class HelpPresenter: HelpPresentable {
    var view: HelpController?
    var router: HelpRoutable?
    var interactor: HelpInteractable?
    
    func pushController(to controller: SettingsPageReference, withData data: Any?) {
        router?.pushController(to: controller, withData: data)
    }
}
