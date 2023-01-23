//
//  Shadows+Borders.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

@IBDesignable extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { if newValue == -1 { layer.cornerRadius = self.frame.size.height / 2 }
                else { layer.cornerRadius = newValue }
        }
    }

    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
        get { if let color = layer.borderColor { return UIColor(cgColor: color) }
            return nil
        }
        set { if let color = newValue { layer.borderColor = color.cgColor }
            else { layer.borderColor = nil }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    

    @IBInspectable var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    
    @IBInspectable var shadowColor: UIColor? {
        get { if let color = layer.shadowColor { return UIColor(cgColor: color) }
            return nil
        }
        set { if let color = newValue { layer.shadowColor = color.cgColor }
            else { layer.shadowColor = nil }
        }
    }
}



@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableImageView: UIImageView {
}

@IBDesignable
class DesignableSegmentControl: UISegmentedControl {
}
