//
//  GradientButtons.swift
//  Policy
//
//  Created by Bradley Ensign on 6/2/22.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var midGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, midGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let midGradientColor = midGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, midGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}




@IBDesignable
class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor,  bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    @IBInspectable
    var midGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor,  bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor,  bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }

    
    @IBInspectable
    var extraGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor,  bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    


    
    func setGradient(topGradientColor: UIColor?, midGradientColor: UIColor?, bottomGradientColor: UIColor?, extraGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor, let midGradientColor = midGradientColor, let extraGradientColor = extraGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, midGradientColor.cgColor, bottomGradientColor.cgColor, extraGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)

            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
            layoutIfNeeded()
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}




@IBDesignable
class GradientLabel: UILabel {
    var gradientColors: [CGColor] = []

    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    @IBInspectable
    var midGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    @IBInspectable
    var extraGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, midGradientColor: midGradientColor, bottomGradientColor: bottomGradientColor, extraGradientColor: extraGradientColor)
        }
    }
    
    
    override func drawText(in rect: CGRect) {
        if let gradientColor = drawGradientColor(in: rect, colors: gradientColors) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }
    
    private func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
    
    
    private func setGradient(topGradientColor: UIColor?, midGradientColor: UIColor?, bottomGradientColor: UIColor?, extraGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let midGradientColor = midGradientColor, let bottomGradientColor = bottomGradientColor, let extraGradientColor = extraGradientColor {
            
            gradientColors = [topGradientColor.cgColor, midGradientColor.cgColor, bottomGradientColor.cgColor, extraGradientColor.cgColor]
        }
    }
}
