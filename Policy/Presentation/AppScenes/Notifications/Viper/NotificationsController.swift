//
//  NotificationsController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

// View needs to be fixed and designed again for that matter
class NotificationsController: UIViewController {
    
    var subview = NotificationsView()
    
    override func loadView() { view = subview }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
        setupSearchBar()
    }
    
    private func setRequirements() {
        // Needs to change
        NotificationsSingleton.shared.getNotifications { [weak self] notifications in
            self?.subview.notifications.items = notifications
        }
        
        title = "Notifications"
        navigationController?.navigationItem.hidesBackButton = true
        subview.notifications.presenter.delegate = self
    }
    
    
    func setupSearchBar() {
        //Should be extension
        subview.searchController.searchResultsUpdater = self
        subview.searchController.searchBar.delegate = self
        subview.searchController.delegate = self
        subview.searchController.obscuresBackgroundDuringPresentation = false
        subview.searchController.searchBar.placeholder = "Wonder your eyes..."

        navigationItem.searchController = subview.searchController
        navigationItem.searchController?.searchBar.isHidden = false
        definesPresentationContext = true
    }

}


extension NotificationsController: CollectionViewDelegate {
    func selected(_ cell: Any?) {
        guard let cell = cell as? Notification else { return }
        print("User's name is \(cell.username.value)")
    }
}



extension NotificationsController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
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
