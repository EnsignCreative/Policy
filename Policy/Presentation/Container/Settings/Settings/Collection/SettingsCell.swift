//
//  SettingsCell.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class SettingsTableCell<U>: UITableViewCell, TableCellView {
    
    var item: U? { didSet { } }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        backgroundColor = .secondaryColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    let iconView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .titleColor
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let title: UILabel = {
        let label = UILabel()
        label.textColor = .titleColor
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let accessoryImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .titleColor
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    func setConstraints() {
        addSubview(iconView)
        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(accessoryImage)
        accessoryImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        accessoryImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        accessoryImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        accessoryImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(title)
        title.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        title.rightAnchor.constraint(equalTo: accessoryImage.leftAnchor, constant: -8).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

