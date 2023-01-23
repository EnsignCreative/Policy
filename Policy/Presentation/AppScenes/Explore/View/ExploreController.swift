//
//  ExploreController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


import UIKit


class ExploreController: UIViewController {

//    var presenter: MapViewProtocol?

    let thisView = ExploreView()
//    var newsFeed = NewsFeedController()
    override func loadView() { view = thisView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
//        addCollectionView(newsCollectionView, to: thisView.newsPlaceholder)
//        newsFeed.thisView.layoutIfNeeded()
    }
    
    
    func setupSearchBar() {
        thisView.searchController.searchResultsUpdater = self
        thisView.searchController.searchBar.delegate = self
        thisView.searchController.delegate = self
        thisView.searchController.obscuresBackgroundDuringPresentation = false
        thisView.searchController.searchBar.placeholder = "Dont look now..."

        navigationItem.searchController = thisView.searchController
        navigationItem.searchController?.searchBar.isHidden = false
        definesPresentationContext = true
//        print(".......................................................................")
//        print(newsFeed.thisView.newsCollectionView.items?.count)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//
//extension MapPageController: MapPresenterToViewProtocol {
//    func updateView(with value: SaveStatus) {
//        print("Error thrown witn \(value)")
//    }
//}





extension ExploreController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let bookmarkAction = searchController.isActive == true ? false : true
        searchController.searchBar.showsBookmarkButton = bookmarkAction
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        navigationItem.searchController?.searchBar.resignFirstResponder()
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.navigationItem.searchController?.searchBar.isHidden = false
        }
    }
}



extension ExploreController {

    @objc func filterButtonTap() {
        print("Present Filters Here")
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        //showAlert, presentVC or whatever you want here
    }


    //Needs Cleaning
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        guard let placeHolder = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
        thisView.searchController.searchBar.placeholder = "Search \(placeHolder)"

//        switch placeHolder {
//        case "People":
//            subview.groupCollectionView.view.isHidden = true
//            subview.profileCollectionView.view.isHidden = false
//            subview.layoutIfNeeded()
//
//        case "Groups":
//            subview.profileCollectionView.view.isHidden = true
//            subview.groupCollectionView.view.isHidden = false
//            subview.layoutIfNeeded()
//
//        default:
//            break
//        }
    }
}


