//
//  AppColors.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

    public class var titleColor: UIColor {
        return UIColor(named: "TitleColor") ?? .black
    }
    
    public class var secondaryColor: UIColor {
        return UIColor(named: "SecondaryColor") ?? UIColor(r: 240, g: 240, b: 240)
    }
    
    public class var descColor: UIColor {
        return UIColor(named: "SecondaryTextColor") ?? .lightGray
    }
}



//
//
//
//extension UIColor {
//
//    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
//        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
//    }
//
//    public class var mainColor: UIColor {
//        return UIColor(named: "BaseColor") ?? .white
//    }
//
//    public class var secondaryColor: UIColor {
//        return UIColor(named: "SecondaryBaseColor") ?? UIColor(r: 240, g: 240, b: 240)
//    }
//
//    public class var buttonColor: UIColor {
//        return UIColor(named: "ButtonColor") ?? .black
//    }
//
//    public class var borderColor: UIColor {
//        return UIColor(named: "BorderColor") ?? .black
//    }
//
//    public class var titleColor: UIColor {
//        return UIColor(named: "TitleColor") ?? .black
//    }
//
//    public class var descColor: UIColor {
//        return UIColor(named: "SecondaryTextColor") ?? .lightGray
//    }
//}
