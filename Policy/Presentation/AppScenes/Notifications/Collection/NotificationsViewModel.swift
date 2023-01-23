//
//  NotificationsModels.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit


class NotificationsViewModel: NotificationsCellView<Notification> {
    override var item: Notification? {
        didSet {
            guard let notification = item else { return }
            
            profileImageView.data = notification
            party.text = notification.party.rawValue
            party.textColor = notification.party.color
            message.text = notification.type.rawValue
            supportButton.isSelected = notification.isSupporter

            let caption = notification.username.rawValue + " " + notification.timeStamp.rawValue
            let final = caption.forBoldWithDate(text: notification.username.rawValue)
            username.attributedText = final
            
            if supportButton.isSelected {
                supportButton.backgroundColor = UIColor(r: 231, g: 231, b: 231)
                supportButton.setTitleColor(.black, for: .selected)
            }
        }
    }
}



//
//
//
//
//
//class NotificationsViewModel: NotificationsCellView<Notification> {
//    override var item: Notification? {
//        didSet {
//            guard let notification = item else { return }
//
//            profileImageView.data = notification
//            party.text = notification.party.rawValue
//            party.textColor = notification.party.color
//            timeStamp.text = notification.timeStamp.value
//            supportButton.isSelected = notification.isSupporter
//
//            let caption = notification.username.rawValue + notification.type.rawValue
//            let final = caption.withBoldText(text: notification.username.rawValue)
//            message.attributedText = final
//
//            if supportButton.isSelected {
//                supportButton.backgroundColor = UIColor(r: 231, g: 231, b: 231)
//                supportButton.setTitleColor(.black, for: .selected)
//            }
//        }
//    }
//}
//
//
