//
//  AppCoordinator.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

//import UIKit
//
//class AppCoordinator: Coordinator {
//
//    var navigationController: NavigationController
//    var childCoordinators = [Coordinator]()
//    var reference: CoordinatorReference?
//    weak var delegate: FinishDelegate?
//
//
//    required init(_ navigationController: NavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func transitionTo(_ instance: PageReference, withData data: Any?) { return }
//
//    func addChild(with reference: CoordinatorReference, andPresent instance: PageReference) {
//        let child = reference.coordinator.init(navigationController)
//        child.delegate = self
//        child.initialize(reference, andPresent: instance)
//        childCoordinators.append(child)
//    }
//}
//
//
//
//extension AppCoordinator: FinishDelegate {
//    func coordinatorDidFinish(childCoordinator: Coordinator) {
//
//        childCoordinators = childCoordinators.filter({ $0.flowReference != childCoordinator.flowReference })
//        navigationController.viewControllers.removeAll()
//
//        switch childCoordinator.flowReference {
//        case .onboarding: addChild(with: .tabs, andPresent: .home)
//        default: break }
//    }
//}
//


