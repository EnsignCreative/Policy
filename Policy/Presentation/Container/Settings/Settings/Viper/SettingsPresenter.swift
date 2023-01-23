//
//  SettingsPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class SettingsPresenter: SettingsPresentable {
    var view: SettingsController?
    var router: SettingsRoutable?
    var interactor: SettingsInteractable?

    func pushTo(_ page: SettingsPageReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}

