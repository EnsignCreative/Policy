//
//  SystemAlerts.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//


import UIKit


enum Ensign: String {
    case partners = "Powered by Skeleton inc. and partners"
    case payment = "In order to keep your information safe, we have partnered with trusted blah blah blah"
    case location = "We do not use your location without your permission. All rights and reserves to the bone yard."
    case unsoliciated = "For your saftey, we blah blah blah. But if for any reason you get an email from us that you werent expecting."
    case sensitiveData = "For your saftey, we blah blah blah. But if for any reason you get an email from us that you werent expecting, then definetly blah blah blah. Otherwise, Blah blah blah. "
    
    var info: String { return self.rawValue }
}



struct AlertData {
    var title: String
    var message: String
    var buttonTitle: String
}

enum SystemAlert: String {
    case logout = "Sign Out"
    case deactivate = "Deactivate Account"
    case deniedPhotos = "You have denied photo Access"
    
    var detail: AlertData {
        switch self {
        case .deniedPhotos:
            return AlertData(title: rawValue, message: message, buttonTitle: "Ok")
        case .logout:
            return AlertData(title: rawValue, message: message, buttonTitle: rawValue)
        case .deactivate:
            return AlertData(title: rawValue, message: message, buttonTitle: "Continue")
        }
    }
    
    var message: String {
        switch self {
        case .logout: return "Are you sure you would like to sign out?"
        case .deactivate: return "Are you sure you want to deactivate your account? This action cannot be un-done."
        case .deniedPhotos: return "Allow photo access by going to Settings/ Privacy/ Photos/ and tapping 'LampLite'"
        }
    }
}

