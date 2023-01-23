//
//  SecurityController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class SecurityCell: SecurityTableCell<SecurityCellModel> {
    override var item: SecurityCellModel? {
        didSet {
            guard let item = item else { return }
            if item.type == .toggle { layoutToggleView() } else { layoutAccessoryView() }
            
            title.text = item.title
            toggle.isOn = isSelected
            userInfo.text = item.value
        }
    }
}







struct SecurityModel {
    var email: SecurityCellModel
    var password: SecurityCellModel
    var login: SecurityCellModel
    var privacy: SecurityCellModel

    init() {
        email =
        SecurityCellModel(title: "Email", value: "EnsignCreative@gmail.com", isSelected: false, type: .textFeild, reference: .email)

        password =
        SecurityCellModel(title: "Password", value: "G************", isSelected: false, type: .textFeild, reference: .password)

        login =
        SecurityCellModel(title: "Login", value: "Save login information", isSelected: true, type: .toggle, reference: .saveLoginInfo)

        privacy =
        SecurityCellModel(title: "Privacy", value: "Allow notifications", isSelected: true, type: .toggle, reference: .allowsNotifications)
    }
}



enum SecurityReference: String {
    case email = "Email"
    case password = "Password"
    case saveLoginInfo = "Security"
    case allowsNotifications = "Notifications"
}


struct SecurityCellModel {
    var title: String
    var value: String
    var isSelected: Bool
    var type: EditorType
    var reference: SecurityReference
     
    init(title: String, value: String, isSelected: Bool, type: EditorType, reference: SecurityReference) {
        self.title = title
        self.value = value
        self.type = type
        self.reference = reference
        self.isSelected = isSelected
    }
}
