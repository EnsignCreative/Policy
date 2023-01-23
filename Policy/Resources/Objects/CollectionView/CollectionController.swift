//
//  CollectionController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class BaseCollectionController<T: CollectionCellView, U>: UICollectionViewController,
                                                          UICollectionViewDelegateFlowLayout {
    var widthMultiple: CGFloat = 1
    var heightMultiple: CGFloat = 1
    var equalWidthAndHeight: Bool = false
    var minimumLineSpacingForSection: CGFloat = 0
    var adjustInsetForSection: UIEdgeInsets = .zero
    
    let presenter = CollectionPresenter()
    let cellId = String(describing: T.self)
    var items: [U]? { didSet { collectionView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(T.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let items = items else { return 0 }
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = items?[indexPath.row] else { return }
        presenter.selected(cell)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { return minimumLineSpacingForSection }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets { return adjustInsetForSection }
    
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard indexPath.row != items?.count else { return presenter.activityView }

        let reuseable = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        guard let cell = reuseable as? T else { return UICollectionViewCell() }
        
        cell.item = items?[indexPath.row] as? T.SomeModel
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView,
                                          layout collectionViewLayout: UICollectionViewLayout,
                                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame.size
        let width = (frame.width / widthMultiple)
        
//        guard indexPath.row != items?.count && presenter.loading else {
//            return CGSize(width: frame.width , height: 50)
//        }
        guard equalWidthAndHeight == false else { return CGSize(width: width, height: width) }
        return CGSize(width: width, height: frame.height / heightMultiple)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 willDisplay cell: UICollectionViewCell,
                                 forItemAt indexPath: IndexPath) {
        guard indexPath.row == items?.count else { return }
        
        presenter.fetch { [weak self] response in
            self?.items = response as? [U] }
    }
}

