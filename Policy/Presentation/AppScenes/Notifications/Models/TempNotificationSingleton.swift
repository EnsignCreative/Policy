//
//  TempnotificationSingleton.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit

final class NotificationsSingleton {
    
    static let shared = NotificationsSingleton()
    private var manager = NotificationsManager()
    

    func getNotifications(completion: @escaping ([Notification]) -> Void) {
        manager.getNotifications { notifications in
            completion(notifications)
        }
    }
}


final class NotificationsManager {
    
    var notifications = [Notification]()
    
    init() {
        let one = Notification(image: .picOne, type: .reply, username: .name1, party: .democrat, timeStamp: .one, isSupporter: false)
        let one2 = Notification(image: .picTwo, type: .likePost, username: .name2, party: .republican, timeStamp: .one, isSupporter: false)
        let one3 = Notification(image: .picThree, type: .comment, username: .name3, party: .independant, timeStamp: .one, isSupporter: true)
        let one4 = Notification(image: .picFour, type: .likeComment, username: .name4, party: .centerLeft, timeStamp: .one, isSupporter: true)
        let one5 = Notification(image: .picFive, type: .dislikePost, username: .name5, party: .centerRight, timeStamp: .one, isSupporter: false)
        let one6 = Notification(image: .picOne, type: .mentionPost, username: .name1, party: .batshitCrazy, timeStamp: .one, isSupporter: true)
        let one7 = Notification(image: .picTwo, type: .dislikedComment, username: .name2, party: .capitalist, timeStamp: .two, isSupporter: false)
        let one8 = Notification(image: .picThree, type: .supporting, username: .name3, party: .communist, timeStamp: .two, isSupporter: false)
        let one9 = Notification(image: .picFour, type: .mentionComment, username: .name4, party: .socialist, timeStamp: .two, isSupporter: true)
        let one10 = Notification(image: .picFive, type: .acceptedRequest, username: .name5, party: .demSocialist, timeStamp: .two, isSupporter: false)
        let one11 = Notification(image: .picOne, type: .suggestion, username: .name1, party: .republican, timeStamp: .two, isSupporter: true)
        let one12 = Notification(image: .picTwo, type: .message, username: .name2, party: .independant, timeStamp: .two, isSupporter: true)

        notifications = [one, one2, one3, one4, one5, one6, one7, one8, one9, one10, one11, one12]
    }
    
    func getNotifications(completion: @escaping ([Notification]) -> Void) {
        completion(notifications)
    }
}
