//
//  ExploreView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


import UIKit

class ExploreView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubViews()
        setConstraints()
        backgroundColor = .white
    }
    

    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()

    let mapView: MapView = {
        let view = MapView()
        view.backgroundColor = .secondaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newsPlaceholder: UIView = {
        let feed = UIView()
        feed.cornerRadius = 20
        feed.backgroundColor = .white
        feed.translatesAutoresizingMaskIntoConstraints = false
        return feed
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "World News"
        label.layer.cornerRadius = 20
        label.textAlignment = .center
        label.backgroundColor = .white
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsCollectionView: NewsFeedCollectionController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let collection = NewsFeedCollectionController(collectionViewLayout: layout)

        collection.view.backgroundColor = .white
        collection.collectionView.showsVerticalScrollIndicator = false
        collection.collectionView.alwaysBounceVertical = true
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    
    private func addSubViews() {
        addSubview(mapView)
        addSubview(newsPlaceholder)
        addSubview(title)
        addSubview(newsCollectionView.view)
    }
    
    private func setConstraints() {
        mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        newsPlaceholder.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        newsPlaceholder.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        newsPlaceholder.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        newsPlaceholder.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 4/10).isActive = true
        
        title.topAnchor.constraint(equalTo: newsPlaceholder.topAnchor, constant: 8).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        newsCollectionView.view.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        newsCollectionView.view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        newsCollectionView.view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        newsCollectionView.view.heightAnchor.constraint(equalTo: newsPlaceholder.heightAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




