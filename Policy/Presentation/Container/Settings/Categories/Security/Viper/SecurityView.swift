//
//  SecurityView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class SecurityController: UIViewController, SecurityViewController {
    
    @IBOutlet weak var tableViewBackground: UIView!

    var presenter: SecurityPresentable?
    var tableView = TableViewController<SecurityCell, SecurityCellModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setRequirements()
    }
}


extension SecurityController {
    func selected(_ cell: Any?) {
        guard let cell = cell as? SecurityCellModel else { return }
        presenter?.pushTo(cell.reference, withData: cell)
    }
}
