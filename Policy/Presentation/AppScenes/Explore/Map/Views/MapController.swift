//
//  MapController.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//

import UIKit


class MapPageController: UIViewController {

//    var presenter: MapViewProtocol?

    let thisView = MapPageView()
    override func loadView() { view = thisView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    func setupSearchBar() {
        thisView.searchController.searchResultsUpdater = self
        thisView.searchController.searchBar.delegate = self
        thisView.searchController.delegate = self
        thisView.searchController.obscuresBackgroundDuringPresentation = false
        thisView.searchController.searchBar.placeholder = "Wonder your eyes..."

        navigationItem.searchController = thisView.searchController
        navigationItem.searchController?.searchBar.isHidden = false
        definesPresentationContext = true
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        print("Maps Page deinit")
    }
}

//
//extension MapPageController: MapPresenterToViewProtocol {
//    func updateView(with value: SaveStatus) {
//        print("Error thrown witn \(value)")
//    }
//}
