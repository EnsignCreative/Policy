//
//  BioController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class BioController: UIViewController, BioViewController {
    
    var presenter: BioPresentable?

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var characterCount: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}


extension BioController {
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        presenter?.pushController(withData: nil)
    }
}
