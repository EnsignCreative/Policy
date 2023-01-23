//
//  Validators.swift
//  Policy
//
//  Created by Bradley Ensign on 6/7/22.
//


import Foundation
import UIKit.UITextField


extension UITextField {
    func validateText(for validationType: ValidatorType) throws -> String {
        let factory = ValidatorFactory.validatorFor(type: validationType)
        return try factory.validate(text)
    }
}



class AgeValidator: ValidatorConvertible {
    func validate(_ value: String?) throws -> String {
        guard let value = value else { throw ValidationError(AgeError.required.message, for: .age) }
        guard value.count < 3 else { throw ValidationError(AgeError.invalid.message, for: .age) }
        guard value.count > 0 else { throw ValidationError(AgeError.required.message, for: .age) }
        guard let age = Int(value) else { throw ValidationError(AgeError.nonNumber.message, for: .age) }
        guard age >= 18 else { throw ValidationError(AgeError.tooYoung.message, for: .age) }
        return value
    }
}


struct UserNameValidator: ValidatorConvertible {
    func validate(_ value: String?) throws -> String {
        guard let value = value else { throw ValidationError(UsernameError.required.message, for: .username) }

        let charSet = NSCharacterSet(charactersIn: ValidatorExpression.usernameChars.value).inverted
        let filtered = value.components(separatedBy: charSet).joined(separator: "")
        let whiteSpace = value.rangeOfCharacter(from: .whitespacesAndNewlines)
        
        guard value != "" else { throw ValidationError(UsernameError.required.message, for: .username) }
        guard value.count < 15 else { throw ValidationError(UsernameError.tooLong.message, for: .username) }
        guard value.count >= 7 else { throw ValidationError(UsernameError.tooShort.message, for: .username) }
        guard whiteSpace == nil else { throw ValidationError(UsernameError.whiteSpaces.message, for: .username) }
        guard filtered == value else { throw ValidationError(UsernameError.specialCharacters.message, for: .username) }

        
        do {
            let expression = try NSRegularExpression(pattern: ValidatorExpression.usernamePattern.value, options: .caseInsensitive)
                                            .firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count))
            
            guard expression != nil else { throw ValidationError(UsernameError.specialCharacters.message, for: .username) }
        } catch { throw ValidationError(UsernameError.specialCharacters.message, for: .username) }; return value
    }
}





struct PasswordValidator: ValidatorConvertible {
    func validate(_ value: String?) throws -> String {
        guard let value = value else { throw ValidationError(PasswordError.required.message, for: .password) }
        
        let numbers = value.rangeOfCharacter(from: .decimalDigits)
        let capitalized = value.rangeOfCharacter(from: .uppercaseLetters)

        guard value != "" else {throw ValidationError(PasswordError.required.message, for: .password) }
        guard numbers != nil else { throw ValidationError(PasswordError.noNumbers.message, for: .password) }
        guard value.count >= 7 else { throw ValidationError(PasswordError.tooShort.message, for: .password) }
        guard capitalized != nil else { throw ValidationError(PasswordError.noUpperCases.message, for: .password) }

        do {
            if try NSRegularExpression(pattern: ValidatorExpression.passwordPattern.value,  options: .caseInsensitive)
                .firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                  throw ValidationError(PasswordError.invalid.message, for: .password) } } catch {
                  throw ValidationError(PasswordError.invalid.message, for: .password) }
                  return value
    }
}



struct EmailValidator: ValidatorConvertible {
    func validate(_ value: String?) throws -> String {
        guard let value = value, value != "" else { throw ValidationError(EmailError.required.message, for: .email) }

        do {
            if try NSRegularExpression(pattern:ValidatorExpression.emailPattern.value, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(EmailError.incorrect.message, for: .email)
            }
        } catch { throw ValidationError(EmailError.incorrect.message, for: .email) }
        
        return value
    }
}



struct ConfirmationValidator: ValidatorConvertible {
    private let password: String
    
    init(_ pass: String) {
        password = pass
    }
    
    func validate(_ value: String?) throws -> String {
        guard let value = value else { throw ValidationError(ConfirmationError.required.message, for: .confirmation(pass: "")) }
        guard value != "" else { throw ValidationError(ConfirmationError.required.message, for: .confirmation(pass: "")) }
        guard password == value else { throw ValidationError(ConfirmationError.mismatch.message, for: .confirmation(pass: "")) }
        return value
    }
}

