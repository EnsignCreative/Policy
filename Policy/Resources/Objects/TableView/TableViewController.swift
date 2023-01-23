//
//  TableViewController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

protocol TableViewDelegate {
    func selected(_ cell: Any?)
}

class TableViewController<T: TableCellView, U>: UITableViewController {
    
    var selectedCell: IndexPath?
    var footerView: UIView = UIView()
    var tableViewHeight: CGFloat = 60
    var separatorColor: UIColor = .black
    var separatorInset: UIEdgeInsets = .zero
    var selectionStyle: UITableViewCell.SelectionStyle = .none
    
    var delegate: TableViewDelegate?
    let cellId = String(describing: T.self)
    var items: [U]? { didSet { tableView.reloadData() } }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        tableView.separatorColor = separatorColor
        tableView.register(T.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewHeight
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = items?[indexPath.row] else { return }
        selectedCell = indexPath
        delegate?.selected(cell)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseable = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        guard let cell = reuseable as? T else { return UITableViewCell() }

        cell.selectionStyle = selectionStyle
        cell.separatorInset = separatorInset
        cell.item = items?[indexPath.row] as? T.SomeModel
        return cell
    }
}







