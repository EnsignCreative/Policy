//
//  TabBarModel.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

//import UIKit
//
//enum TabBarPage: String, CaseIterable {
//
//    case home, camera, profile, explore, notifications
//    var title: String { return rawValue.capitalizeFirstLetter() }
//
//    var detail: TabCoordinatorModel {
//        switch self {
//        case .home: return TabCoordinatorModel(position: 0, icon: .homeLogo, page: .home, reference: .app)
//        case .explore: return TabCoordinatorModel(position: 1, icon: .search, page: .explore, reference: .app)
//        case .camera: return TabCoordinatorModel(position: 2, icon: .camera, page: .camera, reference: .camera)
//        case .profile: return TabCoordinatorModel(position: 4, icon: .profileLogo, page: .personal, reference: .app)
//        case .notifications: return TabCoordinatorModel(position: 3, icon: .heart, page: .notifications, reference: .app) }
//    }
//
//    var reference: Coordinator.Type {
//        switch self {
//        case .camera: return CameraCoordinator.self
//        default: return MainAppCoordinator.self }
//
//    }
//}
//
//
//struct TabCoordinatorModel {
//    var position: Int
//    var icon: UIImage
//    var page: PageReference
//    var reference: CoordinatorReference
//}
//
//
