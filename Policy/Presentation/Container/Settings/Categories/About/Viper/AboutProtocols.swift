//
//  AboutProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol AboutViewController: UIViewController, TableViewDelegate {
    var tableViewBackground: UIView! { get set }
    var presenter: AboutPresentable? { get set }
    var tableView: TableViewController<AboutCell, AboutCellModel> { get set }
    
    func setTableView()
    func setRequirements()
}


protocol AboutRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: AboutPageReference, withData data: Any?)
}

protocol AboutPresentable {
    var view: AboutController? { get set }
    var router: AboutRoutable? { get set }
    var interactor: AboutInteractable? { get set }
    
    func pushTo(_ page: AboutPageReference, withData data: Any?)
}


protocol AboutInteractable {
    var presenter: AboutPresentable? { get set }
}










extension AboutViewController {
    func setTableView() {
        let tableview: TableViewController<AboutCell, AboutCellModel> = {
            let table = TableViewController<AboutCell, AboutCellModel>()
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
        
        let cell = AboutModel()
        tableView.items = [cell.policy, cell.terms]
    }
}
