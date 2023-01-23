//
//  BlurView.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//

import UIKit

class BlurView: UIVisualEffectView {
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    init(effect: UIVisualEffect?, blurStyle style: UIBlurEffect.Style) {
        super.init(effect: UIBlurEffect(style: style))
        
        alpha = 0
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        translatesAutoresizingMaskIntoConstraints = false
    }
        
    func showBlur() {
        DispatchQueue.main.async { [weak self] in
            self?.alpha = 0.5
        }
    }
    
    func hideBlur() {
        DispatchQueue.main.async { [weak self] in
            self?.alpha = 0
        }
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

