//
//  EditorController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import Foundation


enum SettingsElement: String, Codable {
    case darkmode, name, username, contactName, notes, email, website,
         contactEmail, phone, bio, saveLogin, password, privacy, promotions, notifications
}

enum EditorType: String, Codable {
    case toggle, textFeild, phone, textView
}





extension EditorType {
    enum CodingKeys: String, CodingKey {
        case toggle, textFeild, phone, textView
}}

extension SettingsElement {
    enum CodingKeys: String, CodingKey {
        case darkmode, name, username, contactName, notes, email, website,
             contactEmail, phone, bio, saveLogin, password, privacy
}}
