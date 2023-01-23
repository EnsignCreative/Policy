//
//  SettingsProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

protocol SettingsViewController: UIViewController, TableViewDelegate {
    var tableViewBackground: UIView! { get set }
    var presenter: SettingsPresentable? { get set }
    var tableView: TableViewController<SettingsCell, SettingsCellModel> { get set }
    
    func setTableView()
    func setRequirements()
}


protocol Routable {
    static func createViewController() -> UIViewController
    var navigationController: UINavigationController? { get set }
}

protocol SettingsRoutable {
    var navigationController: UINavigationController? { get set }

    static func createViewController() -> UIViewController
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}

protocol SettingsPresentable {
    var view: SettingsController? { get set }
    var router: SettingsRoutable? { get set }
    var interactor: SettingsInteractable? { get set }
    
    func pushTo(_ page: SettingsPageReference, withData data: Any?)
}


protocol SettingsInteractable {
    var presenter: SettingsPresentable? { get set }
}








extension SettingsViewController {
    func setTableView() {
        let tableview: TableViewController<SettingsCell, SettingsCellModel> = {
            let table = TableViewController<SettingsCell, SettingsCellModel>()
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
        
        let settings = SettingsModel()
        tableView.items = [settings.account, settings.security, settings.about, settings.help]
    }
}


