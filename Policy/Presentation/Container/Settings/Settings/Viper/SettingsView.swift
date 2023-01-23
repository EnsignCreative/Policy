//
//  SettingsView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//



import UIKit


class SettingsController: UIViewController, SettingsViewController {
    
    @IBOutlet weak var tableViewBackground: UIView!
    
    var presenter: SettingsPresentable?
    var tableView = TableViewController<SettingsCell, SettingsCellModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setRequirements()
    }
}


extension SettingsController {
    func selected(_ cell: Any?) {
        guard let cell = cell as? SettingsCellModel else { return }
        presenter?.pushTo(cell.pointsTo, withData: nil)
    }
}





