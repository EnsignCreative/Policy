//
//  StringValidation.swift
//  Policy
//
//  Created by Bradley Ensign on 6/7/22.
//


import Foundation
import UIKit.UITextField



protocol ValidatorConvertible {
    func validate(_ value: String?) throws -> String
}

struct ValidationError: Error {
    var message: String
    var type: ValidatorType
    
    init(_ message: String, for type: ValidatorType) {
        self.message = message
        self.type = type
    }
}


enum ValidatorType {
    case age
    case email
    case password
    case username
    case confirmation(pass: String)
    
    var title: String {
        switch self {
        case .age: return "Age"
        case .email: return "Email"
        case .username: return "Username"
        case .password: return "Password"
        case .confirmation: return "Confirmation"
        }
    }
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .age: return AgeValidator()
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .username: return UserNameValidator()
        case .confirmation(let pass): return ConfirmationValidator(pass)
        }
    }
}

