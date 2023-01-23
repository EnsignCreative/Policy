//
//  PicturePresenter.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//


import UIKit

class PicturePresenter: PicturePresentable {
    var view: PictureController?
    var router: PictureRoutable?
    var interactor: PictureInteractable?
    
    func pushController(withData data: Any?) {
        router?.pushController(withData: data)
    }
}

