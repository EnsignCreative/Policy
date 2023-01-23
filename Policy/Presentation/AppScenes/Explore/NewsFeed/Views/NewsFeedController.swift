//
//  NewsFeedController.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//

import UIKit

class NewsFeedController: UIViewController {
    
    var thisView = NewsFeedView()

    override func loadView() { view = thisView }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


