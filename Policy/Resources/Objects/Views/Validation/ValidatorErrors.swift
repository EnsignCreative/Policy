//
//  ValidatorErrors.swift
//  Policy
//
//  Created by Bradley Ensign on 6/7/22.
//

import Foundation


// Use protocol for "message"
enum ValidatorExpression: String {
    case usernamePattern = "^[a-z]{1,18}$"
    case usernameChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
    case emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    case passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
    var value: String { return rawValue }
}


enum UsernameError: String {
    case required = "Username field is Required"
    case isTaken = "Sorry, that username is already taken"
    case tooShort = "Username must contain more than 7 characters"
    case tooLong = "Username must conain less than 15 characters"
    case whiteSpaces = "Username must not contain any whitespaces"
    case specialCharacters = "Username cannot contain any special characters"
    var message: String { return rawValue }
}


enum PasswordError: String {
    case invalid = "Invalid password"
    case required = "Password field is Required"
    case incorrect = "Wrong email or password"
    case noNumbers = "Password must have at least 1 number"
    case tooShort = "Password must contain more than 7 characters"
    case noUpperCases = "Password must have at least 1 uppercase letter"
    var message: String { return rawValue }
}

enum EmailError: String {
    case required = "Email field is Required"
    case incorrect = "Invalid email address"
    case isTaken = "Sorry, that email is already taken"
    var message: String { return rawValue }
}

enum AgeError: String {
    case invalid = "Invalid number"
    case nonNumber = "Age must be a number"
    case required = "Age field is Required"
    case tooYoung = "You have to be over 18 years old to user this service"
    var message: String { return rawValue }
}

enum ConfirmationError: String {
    case mismatch = "Passwords don't match"
    case required = "Confirmation field is Required"
    var message: String { return rawValue }
}
