//
//  MapExtensions.swift
//  Policy
//
//  Created by Bradley Ensign on 1/10/23.
//

import UIKit

extension MapPageController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
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
