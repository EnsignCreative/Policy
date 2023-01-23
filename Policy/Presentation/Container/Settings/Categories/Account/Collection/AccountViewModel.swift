//
//  AccountViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

class AccountCell: SecurityTableCell<AccountCellModel> {
    override var item: AccountCellModel? {
        didSet {
            guard let item = item else { return }
            if item.type == .toggle { layoutToggleView() } else { layoutAccessoryView() }

            title.text = item.title
            toggle.isOn = isSelected
            userInfo.text = item.value
        }
    }
}




struct AccountCellModel {
    var title: String
    var value: String
    var isSelected: Bool
    var type: EditorType
    var reference: AccountReference
     
    init(title: String, value: String, isSelected: Bool, type: EditorType, reference: AccountReference) {
        self.title = title
        self.value = value
        self.type = type
        self.reference = reference
        self.isSelected = isSelected
    }
}








enum AccountReference: String {
    case name, username, website, darkmode, bio
    case profilePrivacy = "Privacy"
    
    var title: String { return rawValue.capitalizeFirstLetter() }
}



struct AccountModel {
    var name: AccountCellModel
    var username: AccountCellModel
    var website: AccountCellModel
    var profilePrivacy: AccountCellModel
    var darkmode: AccountCellModel
    var bio: AccountCellModel

    init() {
        name =
        AccountCellModel(title: "Name", value: "Bradley Ensign", isSelected: false, type: .textFeild, reference: .name)

        username =
        AccountCellModel(title: "Username", value: "bradleyensign", isSelected: false, type: .textFeild, reference: .username)

        website =
        AccountCellModel(title: "Link", value: "SkeletonStandard.com", isSelected: false, type: .textFeild, reference: .website)

        profilePrivacy =
        AccountCellModel(title: "Privacy", value: "Profile is public", isSelected: true, type: .toggle, reference: .profilePrivacy)

        darkmode =
        AccountCellModel(title: "Mode", value: "Dark mode enabled", isSelected: true, type: .toggle, reference: .darkmode)

        bio =
        AccountCellModel(title: "Bio", value: "For somebody who has their bed made, I guess im pretty neat", isSelected: false, type: .textView, reference: .bio)
    }
}



