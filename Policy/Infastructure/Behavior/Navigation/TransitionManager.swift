//
//  Transitions.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

extension UINavigationController {

    func animatePushViewController(with type: CATransitionType, from direction: CATransitionSubtype, to viewController: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = type
            transition.subtype = direction
            self?.view.layer.add(transition, forKey: nil)
            self?.pushViewController(viewController, animated: true)
        }
    }

    private func setTitleImageForNavBar(with image: UIImage) {
          let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 40))
          let imageView = UIImageView(frame: CGRect(x: 90, y: 0, width: 40, height: 40))
          imageView.layer.cornerRadius = 20
          imageView.layer.masksToBounds = true
          imageView.contentMode = .scaleAspectFill
          imageView.image = image
          logoContainer.addSubview(imageView)
          navigationItem.titleView = logoContainer
          navigationController?.tabBarController?.tabBar.isHidden = true
      }
}
