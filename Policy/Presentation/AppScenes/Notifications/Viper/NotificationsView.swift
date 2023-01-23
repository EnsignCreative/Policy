//
//  NotificationsView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//

import UIKit

class NotificationsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubViews()
        setConstraints()
        backgroundColor = .clear
    }
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()
    
    let notifications: BaseCollectionController<NotificationsViewModel, Notification> = {
        let verticle = CollectionLayout(scrollDirection: .vertical)
        let collection = BaseCollectionController<NotificationsViewModel, Notification>(collectionViewLayout: verticle.layout)
        collection.heightMultiple = 7
        collection.minimumLineSpacingForSection = 0.5
        collection.collectionView.backgroundColor = UIColor(r: 231, g: 231, b: 231)
        collection.setScroll(to: .vertical, showsIndicator: false)
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private func addSubViews() {
        addSubview(notifications.view)
    }
    
    private func setConstraints() {
        notifications.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        notifications.view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        notifications.view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        notifications.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


