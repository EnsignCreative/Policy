//
//  PictureView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


import UIKit

class PictureController: UIViewController, PictureViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    var presenter: PicturePresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
    }
}


extension PictureController {
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        presenter?.pushController(withData: nil)
    }
    
    @objc func profileImageTapped(_ sender: UIImageView) {
        print("Image tapped here")
    }
}
