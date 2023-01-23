//
//  ViewAnimations.swift
//  Policy
//
//  Created by Bradley Ensign on 6/7/22.
//

import UIKit

extension UIView {
    func shake(_ text: UILabel) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: text.center.x - 10, y: text.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: text.center.x + 10, y: text.center.y))
        text.layer.add(animation, forKey: "position")
    }
}
