//
//  CoordinatorProtocols.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


//import UIKit
//
//protocol FinishDelegate: AnyObject {
//    func coordinatorDidFinish(childCoordinator: Coordinator)
//}
//
//protocol Coordinator: AnyObject {
//    var navigationController: NavigationController { get set }
//    var childCoordinators: [Coordinator] { get set }
//    var reference: CoordinatorReference? { get set }
//    var delegate: FinishDelegate? { get set }
//
//    init(_ navigationController: NavigationController)
//
//    func deinitalize(_ coordinator: CoordinatorReference?)
//    func transitionTo(_ instance: PageReference, withData data: Any?)
//    func initialize(_ coordinator: CoordinatorReference, andPresent instance: PageReference)
//}
//
//extension Coordinator {
//    func initialize(_ coordinator: CoordinatorReference, andPresent instance: PageReference) {
//        reference = coordinator
//        transitionTo(instance, withData: nil)
//    }
//    func deinitalize(_ coordinator: CoordinatorReference?) {
//        childCoordinators.removeAll()
//        delegate?.coordinatorDidFinish(childCoordinator: self)
//    }
//}

