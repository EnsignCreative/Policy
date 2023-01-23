//
//  HomeView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class HomeController: UIViewController, HomeViewController {
    
    var thisView = HomeView()
    var presenter: HomePresentable?
    
    override func loadView() { view = thisView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
    
    private func setRequirements() {
        thisView.homeFeed.items = getPosts()
        thisView.homeFeed.presenter.delegate = self
    }
}


extension HomeController: CollectionViewDelegate {
    func selected(_ cell: Any?) {
        guard let cell = cell as? TempPost else { return }
        print("Users name is \(cell.username.value)")
    }
}




