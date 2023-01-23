//
//  PictureProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

protocol PictureViewController: UIViewController {
    var profileImage: UIImageView! { get }
    var presenter: PicturePresentable? { get set }
    
    func setRequirements()
}


protocol PictureRoutable {
    var navigationController: UINavigationController? { get set }
    
    func pushController(withData data: Any?)
    static func createViewController() -> PictureController
}

protocol PicturePresentable {
    var view: PictureController? { get set }
    var router: PictureRoutable? { get set }
    var interactor: PictureInteractable? { get set }
    
    func pushController(withData data: Any?)
}


protocol PictureInteractable {
    var presenter: PicturePresentable? { get set }
}



extension PictureViewController {
    func setRequirements() {
        presenter?.router?.navigationController = navigationController

        let gesture = UIGestureRecognizer(target: PictureController.self, action:
                                         #selector(PictureController.profileImageTapped(_:)))
                                         profileImage.addGestureRecognizer(gesture)
    }
}
