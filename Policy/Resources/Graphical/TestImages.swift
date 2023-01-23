//
//  TestImages.swift
//  Policy
//
//  Created by Bradley Ensign on 5/31/22.
//

import UIKit

extension UIImage {
    //Misc Pics
    public class var megaphone: UIImage {
        return UIImage(systemName: "megaphone") ?? UIImage()
    }
    public class var globe: UIImage {
        return UIImage(imageLiteralResourceName: "globe")
    }
    
    public class var activity: UIImage {
        return UIImage(systemName: "globe.americas.fill") ?? UIImage()
    }
    
    
    
    
    // Profile Pics
    public class var picOne: UIImage {
        return UIImage(imageLiteralResourceName: "one")
    }
    public class var picTwo: UIImage {
        return UIImage(imageLiteralResourceName: "two")
    }
    public class var picThree: UIImage {
        return UIImage(imageLiteralResourceName: "three")
    }
    public class var picFour: UIImage {
        return UIImage(imageLiteralResourceName: "four")
    }
    public class var picFive: UIImage {
        return UIImage(imageLiteralResourceName: "five")
    }
}


