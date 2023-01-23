//
//  NavigationManager.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

class NavigationController: UINavigationController {

    var darkMode: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
//        darkMode = AppDefaults.shared.isDarkMode()
        setAppearance()
        setDarkMode()
    }

    private func setAppearance() {
//        navigationBar.backgroundColor = .mainColor
//        navigationBar.tintColor = .titleColor
    }

    private func setDarkMode() {
        let interface: UIUserInterfaceStyle = darkMode == true ? .dark : .light
        let style: UIBarStyle = darkMode == true ? .black : .default
        overrideUserInterfaceStyle = interface
        navigationBar.barStyle = style
        navigationBar.layoutIfNeeded()
    }

    func updateDarkMode(to mode: Bool) {
//        AppDefaults.shared.setDarkMode(to: mode)
//        darkMode = mode
//        setDarkMode()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}



extension UIViewController {
    func navigationWithoutTitle() {
        title = nil
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = .clear
    }

    func navigationWithoutBackButton() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
}
