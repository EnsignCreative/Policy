//
//  MapView.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//

import UIKit

class MapPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubViews()
        setConstraints()
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

    private func addSubViews() {
        addSubview(mapView)
    }
    
    private func setConstraints() {
        mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


