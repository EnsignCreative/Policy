//
//  HomeView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//


import UIKit

// Rename Variable to be more descriptive
class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubViews()
        setConstraints()
    }

    let homeFeed: BaseCollectionController<HomeViewModel, TempPost> = {
        let verticle = CollectionLayout(scrollDirection: .vertical)
        let collection = BaseCollectionController<HomeViewModel, TempPost>(collectionViewLayout: verticle.layout)
        collection.heightMultiple = 1.2
        collection.adjustInsetForSection = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        collection.setScroll(to: .vertical, showsIndicator: false)
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private func addSubViews() {
        addSubview(homeFeed.view)
    }
    
    private func setConstraints() {
        homeFeed.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        homeFeed.view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        homeFeed.view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        homeFeed.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


