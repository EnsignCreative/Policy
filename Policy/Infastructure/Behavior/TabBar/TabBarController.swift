//
//  TabBarController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

//import UIKit
//
//class TabBarController: UITabBarController {
//
//    let pages: [TabBarPage] = [.home, .explore, .camera, .notifications, .profile]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setAppearance()
//    }
//
//    func setAppearance() {
//        tabBar.isTranslucent = false
//        tabBar.tintColor = .titleColor
//        tabBar.barTintColor = .secondaryColor
//        tabBar.backgroundColor = .secondaryColor
//    }
//
//    func setTabBar(controllers tabControllers: [UIViewController]) {
//        setViewControllers(tabControllers, animated: true)
//        selectedIndex = TabBarPage.home.detail.position
//    }
//
//    func currentPage() -> TabBarPage? { TabBarPage.allCases.first(where: { $0.detail.position == selectedIndex }) }
//    func selectPage(_ page: TabBarPage) { selectedIndex = page.detail.position }
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {}
//
//    deinit { NotificationCenter.default.removeObserver(self) }
//}
//
