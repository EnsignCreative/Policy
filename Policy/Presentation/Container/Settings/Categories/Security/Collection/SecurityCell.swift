//
//  SettingsController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


class SecurityTableCell<U>: UITableViewCell, TableCellView {

    var item: U? { didSet { } }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        backgroundColor = .secondaryColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }


    let title: UILabel = {
        let label = UILabel()
        label.textColor = .titleColor
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let userInfo: UILabel = {
        let label = UILabel()
        label.textColor = .titleColor
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let accessoryImage: UIImageView = {
        let image = UIImageView()
        image.image = .pencil
        image.tintColor = .titleColor
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let toggle: UISwitch = {
        let view = UISwitch()
        view.thumbTintColor = .white
        view.tintColor = .titleColor
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    func layoutToggleView() {
        addSubview(toggle)
        toggle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        toggle.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        toggle.widthAnchor.constraint(equalToConstant: 60).isActive = true
        toggle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func layoutAccessoryView() {
        addSubview(accessoryImage)
        accessoryImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        accessoryImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        accessoryImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        accessoryImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    func setConstraints() {
        addSubview(title)
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        title.widthAnchor.constraint(equalToConstant: 50).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(userInfo)
        userInfo.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 4).isActive = true
        userInfo.rightAnchor.constraint(equalTo: rightAnchor, constant: -75).isActive = true
        userInfo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userInfo.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

