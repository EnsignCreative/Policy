//
//  AboutViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class AboutCell: SettingsTableCell<AboutCellModel> {
    override var item: AboutCellModel? {
        didSet {
            guard let item = item else { return }
            
            title.text = item.title
            iconView.image = item.icon
            accessoryImage.image = item.accessory
        }
    }
}


struct AboutModel {
    var policy: AboutCellModel
    var terms: AboutCellModel
    
    init() {
        policy =
        AboutCellModel(title: "Policy", icon: .lightBulb, accessory: .arrow, reference: .policy)
        
        terms =
        AboutCellModel(title: "Terms of Service", icon: .newspaper, accessory: .arrow, reference: .terms)
    }
}


struct AboutCellModel {
    var title: String
    var icon: UIImage
    var accessory: UIImage
    var reference: AboutPageReference
     
    init(title: String, icon: UIImage, accessory: UIImage, reference: AboutPageReference) {
        self.icon = icon
        self.title = title
        self.reference = reference
        self.accessory = accessory
    }
}

enum AboutPageReference: String {
    case policy = "Policy"
    case terms = "Terms of Service"
}

