//
//  HelpView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class HelpController: UIViewController, HelpViewController {
        
    var presenter: HelpPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}


