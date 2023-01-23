//
//  ColorHelpers.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

extension UIColor {
    public func adjust(hueBy hue: CGFloat = 0, saturationBy saturation: CGFloat = 0, brightnessBy brightness: CGFloat = 0) -> UIColor {
        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrightness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrightness, alpha: &currentAlpha) {
            return UIColor(hue: currentHue + hue, saturation: currentSaturation + saturation, brightness: currentBrightness + brightness, alpha: currentAlpha)
            
        } else { return self }
    }
}
