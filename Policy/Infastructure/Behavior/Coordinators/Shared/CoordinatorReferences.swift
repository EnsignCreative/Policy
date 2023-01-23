//
//  CoordinatorReferences.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


//import UIKit
//
//enum CoordinatorReference: String {
//
//    case base, staging, tabs, app, camera, settings
//
//    var coordinator: Coordinator.Type {
//        switch self {
//        case .base: return AppCoordinator.self
//        case .tabs: return TabCoordinator.self
//        case .app: return MainAppCoordinator.self
//        case .camera: return CameraCoordinator.self
//        case .settings: return SettingsCoordinator.self
//        case .staging: return OnBoardingCoordinator.self }
//
//    }
//}
//
//enum PageReference: String, Codable {
//    case home, profile, post, followers, following, explore,
//         notifications, splash, signIn, bio, interests, camera,
//         filters, caption, confirm, settings, account, security,
//         none, about, editor, policy, document, finish, chats, message, start,
//         signUp = "Sign Up", help = "Help Center", personal = "Profile",
//         terms = "Terms of Use", profilePic = "Profile Pic"
//
//    var title: String { return rawValue.capitalizeFirstLetter() }
//}
//
//
//extension PageReference {
//    enum CodingKeys: String, CodingKey {
//        case home, profile, post, followers, following, explore,
//             notifications, splash, signIn, bio, interests, camera,
//             filters, caption, confirm, settings, account, security,
//             about, editor, policy, finish, none, chats, message,
//             profilePic, signUp, help = "Help Center", personal, terms = "Terms of Use"
//
//}}
//
//
