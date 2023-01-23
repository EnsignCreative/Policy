//
//  InterestsProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

protocol InterestsViewController: UIViewController, CollectionViewDelegate {
    var collectionBackground: UIView! { get set }
    var presenter: InterestsPresentable? { get set }
    var collection: BaseCollectionController<InterestsViewModel, InterestCellModel> { get set }
    
    func setRequirements()
    func setCollectionView()
}


protocol InterestsRoutable {
    var navigationController: UINavigationController? { get set }
    
    func pushController(withData data: Any?)
    static func createViewController() -> InterestsController
}

protocol InterestsPresentable {
    var view: InterestsController? { get set }
    var router: InterestsRoutable? { get set }
    var interactor: InterestsInteractable? { get set }
    
    func pushController(withData data: Any?)
}


protocol InterestsInteractable {
    var presenter: InterestsPresentable? { get set }
}










extension InterestsViewController {
    func setCollectionView() {
        let collectionView: BaseCollectionController<InterestsViewModel, InterestCellModel> = {
            let verticle = CollectionLayout(scrollDirection: .vertical)
            let collection = BaseCollectionController<InterestsViewModel, InterestCellModel>(collectionViewLayout: verticle.layout)
            collection.widthMultiple = 2
            collection.equalWidthAndHeight = true
            collection.setScroll(to: .vertical, showsIndicator: false)
            collection.view.translatesAutoresizingMaskIntoConstraints = false
            return collection
        }()
        
        collection = collectionView
        collection.presenter.delegate = self
        addCollectionView(collection, to: collectionBackground)
    }
    
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
    }
}
