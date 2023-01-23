//
//  SecurityProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol SecurityViewController: UIViewController, TableViewDelegate {
    var tableViewBackground: UIView! { get set }
    var presenter: SecurityPresentable? { get set }
    var tableView: TableViewController<SecurityCell, SecurityCellModel> { get set }
    
    func setTableView()
    func setRequirements()
}


protocol SecurityRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: SecurityReference, withData data: Any?)
}

protocol SecurityPresentable {
    var view: SecurityController? { get set }
    var router: SecurityRoutable? { get set }
    var interactor: SecurityInteractable? { get set }
    
    func pushTo(_ page: SecurityReference, withData data: Any?)
}


protocol SecurityInteractable {
    var presenter: SecurityPresentable? { get set }
}








extension SecurityViewController {
    func setTableView() {
        let tableview: TableViewController<SecurityCell, SecurityCellModel> = {
            let table = TableViewController<SecurityCell, SecurityCellModel>()
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
        
        let cell = SecurityModel()
        tableView.items = [cell.email, cell.password, cell.login, cell.privacy]
    }
}
