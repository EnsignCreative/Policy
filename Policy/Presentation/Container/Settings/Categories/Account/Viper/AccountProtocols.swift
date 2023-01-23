//
//  AccountProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol AccountViewController: UIViewController, TableViewDelegate {
    var tableViewBackground: UIView! { get set }
    var presenter: AccountPresentable? { get set }
    var tableView: TableViewController<AccountCell, AccountCellModel> { get set }
    
    func setTableView()
    func setRequirements()
}


protocol AccountRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: AccountReference, withData data: Any?)
}

protocol AccountPresentable {
    var view: AccountController? { get set }
    var router: AccountRoutable? { get set }
    var interactor: AccountInteractable? { get set }
    
    func pushTo(_ page: AccountReference, withData data: Any?)
}


protocol AccountInteractable {
    var presenter: AccountPresentable? { get set }
}










extension AccountViewController {
    func setTableView() {
        let tableview: TableViewController<AccountCell, AccountCellModel> = {
            let table = TableViewController<AccountCell, AccountCellModel>()
            table.tableViewHeight = 60
            table.view.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()

        tableView = tableview
        tableView.delegate = self
        addTableView(tableView, to: tableViewBackground)
    }
    
    func setRequirements() {
        presenter?.router?.navigationController = navigationController
        
        let cell = AccountModel()
        tableView.items = [cell.name, cell.username, cell.website, cell.profilePrivacy, cell.darkmode, cell.bio]
    }
}
