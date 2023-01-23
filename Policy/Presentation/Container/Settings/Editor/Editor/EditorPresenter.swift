//
//  EditorPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class EditorPresenter: EditorPresentable {
    var view: EditorController?
    var router: EditorRoutable?
    var interactor: EditorInteractable?

    func pushTo(_ page: SettingsPageReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}

