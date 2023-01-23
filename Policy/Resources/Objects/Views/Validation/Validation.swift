//
//  Validation.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//

import Foundation
import UIKit.UITextField
//
//
//extension UITextField {
//    func validatedText(validationType: ValidatorType) throws -> String {
//        let validator = ValidatorFactory.validatorFor(type: validationType)
//        guard let string = text else { throw ValidationError("\(placeholder ?? "") is a required field", for: validationType) }
//        return try validator.validated(string)
//    }
//}
//
//
//
//
//class ValidationError: Error {
//    var message: String
//    var type: ValidatorType
//
//    init(_ message: String, for type: ValidatorType) {
//        self.message = message
//        self.type = type
//    }
//}
//
//protocol ValidatorConvertible {
//    func validated(_ value: String) throws -> String
//}
//
//
//enum ValidatorType {
//    case age
//    case email
//    case password
//    case username
//    case confirmation(pass: String)
//    case requiredField(field: String)
//}
//
//enum ValidatorFactory {
//    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
//        switch type {
//        case .age: return AgeValidator()
//        case .email: return EmailValidator()
//        case .password: return PasswordValidator()
//        case .username: return UserNameValidator()
//        case .confirmation(let pass): return ConfirmationValidator(pass)
//        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName, for: type)
//        }
//    }
//}
//
//
//class AgeValidator: ValidatorConvertible {
//    func validated(_ value: String) throws -> String {
//        guard value.count > 0 else { throw ValidationError("Age is required", for: .age)}
//        guard let age = Int(value) else { throw ValidationError("Age must be a number!", for: .age)}
//        guard value.count < 3 else { throw ValidationError("Invalid age number!", for: .age)}
//        guard age >= 18 else { throw ValidationError("You have to be over 18 years old to user our app :)", for: .age)}
//        return value
//    }
//}
//
//struct RequiredFieldValidator: ValidatorConvertible {
//    private let fieldName: String
//    private let validator: ValidatorType
//
//    init(_ field: String, for type: ValidatorType) {
//        fieldName = field
//        validator = type
//    }
//
//    func validated(_ value: String) throws -> String {
//        guard !value.isEmpty else {
//            throw ValidationError("Required field " + fieldName, for: validator)
//        }
//        return value
//    }
//}
//
//struct UserNameValidator: ValidatorConvertible {
//    func validated(_ value: String) throws -> String {
//
//        let acceptableCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
//        let charSet = NSCharacterSet(charactersIn: acceptableCharacters).inverted
//        let filtered = value.components(separatedBy: charSet).joined(separator: "")
//
//
//        guard filtered == value else {
//            throw ValidationError("Username cannot contain any special characters", for: .username )
//        }
//        guard value.count >= 7 else {
//            throw ValidationError("Username must contain more than 7 characters", for: .username )
//        }
//        guard value.count < 15 else {
//            throw ValidationError("Username must conain less than 15 characters", for: .username )
//        }
//        if let _ = value.rangeOfCharacter(from: .whitespacesAndNewlines) {
//            throw ValidationError("Username must not contain any whitespaces", for: .username )
//        }
//
//
//        do {
//            if try NSRegularExpression(pattern: "^[a-z]{1,18}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                throw ValidationError("Username must not contain special characters", for: .username)
//            }
//        } catch {
//            throw ValidationError("Username must not contain special characters", for: .username)
//        }
//
//        if available(for: value) != true {
//            throw ValidationError("Sorry, that username is already taken", for: .username)
//        }
//        return value
//    }
//
//    private func available(for text: String) -> Bool {
//        // Check if already exists
//        return true
//    }
//}
//
//struct PasswordValidator: ValidatorConvertible {
//    func validated(_ value: String) throws -> String {
//
//        let capitalized = value.rangeOfCharacter(from: .uppercaseLetters)
//        let numbers = value.rangeOfCharacter(from: .decimalDigits)
//
//        guard value != "" else {throw ValidationError("Password is Required", for: .password)}
//        guard value.count >= 7 else { throw ValidationError("Password must have at least 7 characters", for: .password) }
//        guard numbers != nil else { throw ValidationError("Password must have at least 1 number", for: .password) }
//        guard capitalized != nil else { throw ValidationError("Password must have at least 1 uppercase letter", for: .password) }
//
//        do {
//            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                throw ValidationError("Invalid password", for: .password)
//            }
//        } catch {
//            throw ValidationError("Invalid password", for: .password)
//        }
//        return value
//    }
//}
//
//struct EmailValidator: ValidatorConvertible {
//    func validated(_ value: String) throws -> String {
//        do {
//            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                throw ValidationError("Invalid e-mail Address", for: .email)
//            }
//        } catch {
//            throw ValidationError("Invalid e-mail Address", for: .email)
//        }
//
//        if available(for: value) != true {
//            throw ValidationError("Sorry, that email is already taken", for: .email)
//        }
//
//        return value
//    }
//
//    private func available(for text: String) -> Bool {
//        // Check if already exists
//        return true
//    }
//}
//
//
//
//struct ConfirmationValidator: ValidatorConvertible {
//    private let password: String
//
//    init(_ pass: String) {
//        password = pass
//    }
//
//    func validated(_ value: String) throws -> String {
//        guard password == value else { throw ValidationError("Passwords don't match", for: .confirmation(pass: "")) }
//        return value
//    }
//}
