//
//  AboutPresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class AboutPresenter: AboutPresentable {
    var view: AboutController?
    var router: AboutRoutable?
    var interactor: AboutInteractable?
    
    func pushTo(_ page: AboutPageReference, withData data: Any?) {
        router?.pushTo(page, withData: data)
    }
}
