//
//  SplashController.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//


import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginAnimation()
    }
    
    
    private func beginAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.pushToNotificationsController()
        }
    }
    
    private func pushToSignInController() {
        let controller = SignInRouter.createViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func pushToExploreController() {
        let controller = ExploreController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func pushToNotificationsController() {
        let controller = NotificationsController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func pushToHomeController() {
        let controller = HomeController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func pushToProfileController() {
        let controller = ProfileController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

