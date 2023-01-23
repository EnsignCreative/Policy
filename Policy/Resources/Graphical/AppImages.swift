//
//  AppImages.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit


extension UIImage {
    public class var appLogo: UIImage {
        return UIImage(imageLiteralResourceName: "AppLogo")
    }

    public class var menu: UIImage {
        return UIImage(systemName: "line.horizontal.3.decrease") ?? UIImage()
    }
    
    public class var unfilledCheck: UIImage {
        return UIImage(systemName: "app.badge.checkmark") ?? UIImage()
    }

    public class var filledCheck: UIImage {
        return UIImage(systemName: "app.badge.checkmark.fill") ?? UIImage()
    }
    
    public class var heart: UIImage {
        return UIImage(systemName: "heart") ?? UIImage()
    }
    
    public class var unheart: UIImage {
        return UIImage(systemName: "heart.slash") ?? UIImage()
    }

    public class var heartFilled: UIImage {
        return UIImage(systemName: "heart.fill") ?? UIImage()
    }
    
    public class var darkMode: UIImage {
        return UIImage(systemName: "moon.circle.fill") ?? UIImage()
    }

    public class var lightMode: UIImage {
        return UIImage(systemName: "moon.circle") ?? UIImage()
    }

    public class var lock: UIImage {
        return UIImage(systemName: "lock.shield") ?? UIImage()
    }

    public class var info: UIImage {
        return UIImage(systemName: "info.circle") ?? UIImage()
    }

    public class var help: UIImage {
        return UIImage(systemName: "lifepreserver") ?? UIImage()
    }

    public class var block: UIImage {
        return UIImage(systemName: "hand.raised") ?? UIImage()
    }

    public class var key: UIImage {
        return UIImage(systemName: "key") ?? UIImage()
    }

    public class var keySaved: UIImage {
        return UIImage(systemName: "cloud") ?? UIImage()
    }
    
    public class var arrow: UIImage {
        return UIImage(systemName: "arrow.right") ?? UIImage()
    }
    
    public class var person: UIImage {
        return UIImage(systemName: "person") ?? UIImage()
    }
    
    public class var lightBulb: UIImage {
        return UIImage(systemName: "lightbulb.circle") ?? UIImage()
    }
    
    public class var newspaper: UIImage {
        return UIImage(systemName: "newspaper.circle") ?? UIImage()
    }
    
    public class var pencil: UIImage {
        return UIImage(systemName: "pencil.circle.fill") ?? UIImage()
    }

    public class var share: UIImage {
        return UIImage(systemName: "paperplane") ?? UIImage()
    }
    
    public class var comment: UIImage { // This cannot stay. Used for Apple Messaging only
        return UIImage(systemName: "message") ?? UIImage()
    }
    public class var flag: UIImage {
        return UIImage(systemName: "flag") ?? UIImage()
    }
    
    public class var newSupporter: UIImage {
        return UIImage(systemName: "person.crop.circle.fill.badge.plus") ?? UIImage()
    }
    
    public class var thumbsUp: UIImage {
        return UIImage(systemName: "hand.thumbsup.circle.fill") ?? UIImage()
    }
    public class var thumbsDown: UIImage {
        return UIImage(systemName: "hand.thumbsdown.circle.fill") ?? UIImage()
    }
    
    public class var noteMessage: UIImage { // This cannot stay.
        return UIImage(systemName: "message.circle.fill") ?? UIImage()
    }
    
    public class var mentioned: UIImage {
        return UIImage(systemName: "purchased.circle.fill") ?? UIImage()
    }
    
    public class var acceptedRequest: UIImage {
        return UIImage(systemName: "person.crop.circle.fill.badge.checkmark") ?? UIImage()
    }
    
    public class var suggestion: UIImage {
        return UIImage(systemName: "person.crop.circle.badge.questionmark.fill") ?? UIImage()
    }
}






//extension UIImage {
//
//    public class var appLogo: UIImage {
//        return UIImage(imageLiteralResourceName: "AppLogo")
//    }
//
//    public class var unfilledCheck: UIImage {
//        return UIImage(systemName: "app.badge.checkmark") ?? UIImage()
//    }
//
//    public class var filledCheck: UIImage {
//        return UIImage(systemName: "app.badge.checkmark.fill") ?? UIImage()
//    }
//
//    public class var apple: UIImage {
//        return UIImage(imageLiteralResourceName: "AppleLogo")
//    }
//
//    public class var google: UIImage {
//        return UIImage(imageLiteralResourceName: "GoogleLogo")
//    }
//
//    public class var facebook: UIImage {
//        return UIImage(imageLiteralResourceName: "FacebookLogo")
//    }
//
//    public class var homeLogo: UIImage {
//        return UIImage(systemName: "house") ?? UIImage()
//    }
//
//    public class var globeLogo: UIImage {
//        return UIImage(systemName: "globe.americas") ?? UIImage()
//    }
//
//    public class var profileLogo: UIImage {
//        return UIImage(systemName: "person.3") ?? UIImage()
//    }

//    public class var personLogo: UIImage {
//        return UIImage(systemName: "person") ?? UIImage()
//    }
//
//    public class var search: UIImage {
//        return UIImage(systemName: "magnifyingglass") ?? UIImage()
//    }

//    public class var menu: UIImage {
//        return UIImage(systemName: "line.horizontal.3.decrease") ?? UIImage()
//    }


//    public class var questionMark: UIImage {
//        return UIImage(systemName: "questionmark") ?? UIImage()
//    }
//
//    public class var heart: UIImage {
//        return UIImage(systemName: "heart") ?? UIImage()
//    }
//
//    public class var heartFilled: UIImage {
//        return UIImage(systemName: "heart.fill") ?? UIImage()
//    }
//
//    public class var camera: UIImage {
//        return UIImage(systemName: "camera") ?? UIImage()
//    }
//
//    public class var money: UIImage {
//        return UIImage(systemName: "dollarsign.circle") ?? UIImage()
//    }
//
//    public class var threeDots: UIImage {
//        return UIImage(systemName: "ellipsis") ?? UIImage()
//    }
//
//    public class var messages: UIImage {
//        return UIImage(systemName: "paperplane") ?? UIImage()
//    }
//

//
//    public class var confirmation: UIImage {
//        return UIImage(systemName: "square.filled.on.square") ?? UIImage()
//    }
//

//
//    public class var creditCard: UIImage {
//        return UIImage(systemName: "creditcard") ?? UIImage()
//    }
//    public class var creditCardFill: UIImage {
//        return UIImage(systemName: "creditcard.fill") ?? UIImage()
//    }
//    public class var chat: UIImage {
//        return UIImage(systemName: "bubble.left") ?? UIImage()
//    }
//


//    public class var reciept: UIImage {
//        return UIImage(systemName: "list.bullet.rectangle.portrait") ?? UIImage()
//    }
//    public class var phone: UIImage {
//        return UIImage(systemName: "phone") ?? UIImage()
//    }
//    public class var shippingBox: UIImage {
//        return UIImage(systemName: "shippingbox") ?? UIImage()
//    }
//    public class var greaterthan: UIImage {
//        return UIImage(systemName: "greaterthan") ?? UIImage()
//    }
//    public class var share: UIImage {
//        return UIImage(systemName: "square.and.arrow.up") ?? UIImage()
//    }
//    public class var download: UIImage {
//        return UIImage(systemName: "square.and.arrow.down") ?? UIImage()
//    }
//    public class var imageSelection: UIImage {
//        return UIImage(systemName: "photo.on.rectangle.angled") ?? UIImage()
//    }
//}
//


