//
//  AccountView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//



import UIKit


class AccountController: UIViewController, AccountViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableViewBackground: UIView!

    var presenter: AccountPresentable?
    var tableView = TableViewController<AccountCell, AccountCellModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setRequirements()
    }
}


extension AccountController {
    func selected(_ cell: Any?) {
        guard let cell = cell as? AccountCellModel else { return }
        presenter?.pushTo(cell.reference, withData: cell)
    }
}
