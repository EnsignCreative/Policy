//
//  InterestView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class InterestsController: UIViewController, InterestsViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var collectionBackground: UIView!
    
    var presenter: InterestsPresentable?
    var collection = BaseCollectionController<InterestsViewModel, InterestCellModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequirements()
        setCollectionRequirements()
    }
    
    private func setCollectionRequirements() {
        setCollectionView()
        collection.items = getInterests()
    }
}


extension InterestsController {
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        presenter?.pushController(withData: nil)
    }
    
    func selected(_ cell: Any?) {
        guard let interest = cell as? InterestCellModel else { return }
        
        print("Interest name is \(interest.name.value)")
    }
}


