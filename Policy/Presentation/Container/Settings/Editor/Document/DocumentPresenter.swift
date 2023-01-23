//
//  DocumentPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class DocumentPresenter: DocumentPresentable {
    var view: DocumentController?
    var router: DocumentRoutable?
    var interactor: DocumentInteractable?

    func pushTo(_ page: SettingsPageReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}

