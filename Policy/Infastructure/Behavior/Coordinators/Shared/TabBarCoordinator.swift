//
//  TabBarCoordinator.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//
//
//import UIKit
//
//class TabCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
//
//    var navigationController: NavigationController
//    var childCoordinators = [Coordinator]()
//    var tabBarController: TabBarController
//    var flowReference: FlowReference? = .tabs
//    weak var delegate: FinishDelegate?
//
//
//    required init(_ navigationController: NavigationController) {
//        self.navigationController = navigationController
//        self.tabBarController = .init()
//    }
//
//    func transitionTo(_ instance: PageReference, withData data: Any?) {
//        let pages = tabBarController.pages.sorted(by: { $0.detail.position < $1.detail.position })
//        let controllers: [NavigationController] = pages.map({ createTabController($0) })
//        tabBarController.delegate = self
//        tabBarController.setTabBar(controllers: controllers)
//        navigationController.viewControllers = [tabBarController]
//    }
//
//
//    private func createTabController(_ page: TabBarPage) -> NavigationController {
//        let tabBarItem = UITabBarItem.init(title: page.title, image: page.detail.icon, tag: page.detail.position)
//
//        let navigation = NavigationController()
//        navigation.tabBarItem = tabBarItem
//
//        let coordinator = page.flow.init(navigation)
//        coordinator.delegate = delegate
//        coordinator.initialize(page.detail.flow, andPresent: page.detail.page)
//        childCoordinators.append(coordinator)
//        return navigation
//    }
//
//    deinit { NotificationCenter.default.removeObserver(self) }
//}
//
//
//
//extension TabCoordinator: FinishDelegate {
//    func coordinatorDidFinish(childCoordinator: Coordinator) {
//        childCoordinators = childCoordinators.filter({ $0.flowReference != childCoordinator.flowReference })
//        navigationController.viewControllers.removeAll()
//
//        switch childCoordinator.flowReference {
//        case .settings: tabBarController.selectPage(.profile)
//        case .camera: tabBarController.selectPage(.home)
//        default: break }
//    }
//}
//
//
//
