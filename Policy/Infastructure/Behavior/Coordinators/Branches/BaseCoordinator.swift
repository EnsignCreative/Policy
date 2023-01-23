//
//  BaseCoordinator.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

//import UIKit
//
//class MainAppCoordinator: Coordinator {
//
//    var navigationController: NavigationController
//    var childCoordinators = [Coordinator]()
//    var reference: CoordinatorReference?
//    var delegate: FinishDelegate?
//
//    required init(_ navigationController: NavigationController) {
//        self.navigationController = navigationController
//        reference = .app
//    }
//
//    func pushTo<T: MainAppFlow>(_ controller: T.Type, with reference: PageReference, and data: Any?) {
//        let viewController = MainAppRouter.create(controller, with: self)
//        viewController.title = reference.title
//        navigationController.pushViewController(viewController, animated: true)
//    }
//
//    func addChild(with flow: CoordinatorReference, andPresent instance: PageReference) {
//        let child = flow.coordinator.init(navigationController)
//        child.delegate = delegate
//        child.initialize(flow, andPresent: instance)
//        childCoordinators.append(child)
//    }
//
//    func transitionTo(_ instance: PageReference, withData data: Any?) {
//        switch instance {
//        case .home: pushTo(HomeController.self, with: instance, and: data)
//        case .post: pushTo(PostController.self, with: instance, and: data)
//        case .explore: pushTo(ExploreController.self, with: instance, and: data)
//        case .profile: pushTo(ProfileController.self, with: instance, and: data)
//        case .personal: pushTo(PrivateController.self, with: instance, and: data)
//        case .followers: pushTo(FollowController.self, with: instance, and: data)
//        case .following: pushTo(FollowController.self, with: instance, and: data)
//        case .notifications: pushTo(NotificationsController.self, with: instance, and: data)
//        case .finish: deinitalize(flowReference)
//        default: break }
//    }
//}
