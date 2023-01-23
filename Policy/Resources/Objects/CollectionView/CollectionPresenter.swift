//
//  CollectionProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class CollectionPresenter {
    var loading: Bool = true
    var delegate: CollectionViewDelegate?
    var refreshView = UIRefreshControl()
    var activityView = CollectionActivityViewCell()
    
    init() { refreshView = createRefresh(with: "Refreshing...", andColor: .titleColor) }
    
    
    func createRefresh(with title: String, andColor color: UIColor) -> UIRefreshControl {
        refreshView.attributedTitle = NSAttributedString(string: title, attributes: nil)
        return refreshView
    }
    
    func startRefreshing() {
        loading = true
        refreshView.beginRefreshing()
    }
    
    func startActivityView() {
        loading = true
        activityView.indicator.startAnimating()
    }
    
    func stopUpdating() {
        loading = false
        refreshView.endRefreshing()
        activityView.indicator.stopAnimating()
    }
}




// Only Acting as the Middle Man Between the View and the Collaction View
extension CollectionPresenter {
    func selected(_ cell: Any?) { delegate?.selected(cell) }
    
    func refresh(_ completion: @escaping (Any?) -> ()) {
        startRefreshing()
        
        delegate?.refresh({ [weak self] response in
            self?.stopUpdating()
            completion(response)
        })
    }
    
    func fetch(_ completion: @escaping (Any?) -> ()) {
        startActivityView()
        
        delegate?.fetch({ [weak self] response in
            self?.stopUpdating()
            completion(response)
        })
    }
}


