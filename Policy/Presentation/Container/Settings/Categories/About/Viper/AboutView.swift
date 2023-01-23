//
//  AboutView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class AboutController: UIViewController, AboutViewController {
    
    @IBOutlet weak var tableViewBackground: UIView!

    var presenter: AboutPresentable?
    var tableView = TableViewController<AboutCell, AboutCellModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setRequirements()
    }
}


extension AboutController {
    func selected(_ cell: Any?) {
        guard let cell = cell as? AboutCellModel else { return }
        presenter?.pushTo(cell.reference, withData: cell)
    }
}
