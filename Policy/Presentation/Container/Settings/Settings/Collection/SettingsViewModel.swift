//
//  SettingsViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class SettingsCell: SettingsTableCell<SettingsCellModel> {
    override var item: SettingsCellModel? {
        didSet {
            guard let item = item else { return }
            
            title.text = item.title
            iconView.image = item.icon
            accessoryImage.image = item.accessory
        }
    }
}




struct SettingsModel {
    var account: SettingsCellModel
    var security: SettingsCellModel
    var help: SettingsCellModel
    var about: SettingsCellModel

    init() {
        account =
        SettingsCellModel(title: "Account", icon: .person, accessory: .arrow, pointsTo: .account)
        
        security =
        SettingsCellModel(title: "Security", icon: .lock, accessory: .arrow, pointsTo: .security)
        
        about =
        SettingsCellModel(title: "About", icon: .info, accessory: .arrow, pointsTo: .about)
        
        help =
        SettingsCellModel(title: "Help Center", icon: .help, accessory: .arrow, pointsTo: .help)
    }
}



struct SettingsCellModel {
    var title: String
    var icon: UIImage
    var accessory: UIImage
    var pointsTo: SettingsPageReference
     
    init(title: String, icon: UIImage, accessory: UIImage, pointsTo: SettingsPageReference) {
        self.title = title
        self.icon = icon
        self.accessory = accessory
        self.pointsTo = pointsTo
    }
}


enum SettingsPageReference: String {
    case account, security, about, help
    
    var title: String { return rawValue.capitalizeFirstLetter() }
    
    var router: Routable.Type {
        switch self {
        case .account: return AccountRouter.self
        case .security: return SecurityRouter.self
        case .about: return AboutRouter.self
        case .help: return HelpRouter.self
        }
    }
}

