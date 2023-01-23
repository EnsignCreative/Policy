//
//  TableCellView.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

protocol TableCellView: UITableViewCell {
    associatedtype SomeModel where SomeModel: Any
    var item: SomeModel? { get set }
}

class BaseTableViewCell<U>: UITableViewCell, TableCellView {

    var item: U? { didSet { backgroundColor = .clear } }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

