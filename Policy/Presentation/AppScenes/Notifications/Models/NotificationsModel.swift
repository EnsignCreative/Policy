//
//  NotificationsModel.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit

//    commented on, replied to, mentioned you, like your, disliked your, supporting you, accepted your request, new suggestion
//    - if not following, show person with plus icon in the right.


// Temp
enum NotificationType: String {
    case comment = "Left a comment on your post!"
    case reply = "Replied to your comment!"
    case likePost = "Liked your post!"
    case likeComment = "Liked your comment!"
    case dislikePost = "Disliked your post..."
    case dislikedComment = "Disliked your comment..."
    case mentionPost = "Mentioned you in their post!"
    case mentionComment = "Mentioned you in a comment!"
    case supporting = "Started supporting you!"
    case acceptedRequest = "Accepted your request!"
    case suggestion = "Has a possible connection to you!"
    case message = "Sent you a message!"
    var value: String { return rawValue }
    
    // Icon to change: reply, mentioned anything,
    var icon: NotificationDetail {
        switch self {
        case .reply: return NotificationDetail(image: .noteMessage, color: .blue)
        case .likePost: return NotificationDetail(image: .heart, color: .red)
        case .comment: return NotificationDetail(image: .noteMessage, color: .green)
        case .likeComment: return NotificationDetail(image: .thumbsUp, color: .green)
        case .dislikePost: return NotificationDetail(image: .unheart, color: .blue)
        case .dislikedComment:  return NotificationDetail(image: .thumbsDown, color: .red)
        case .mentionPost: return NotificationDetail(image: .mentioned, color: .yellow)
        case .mentionComment: return NotificationDetail(image: .mentioned, color: .yellow)
        case .supporting: return NotificationDetail(image: .newSupporter, color: .red)
        case .acceptedRequest: return NotificationDetail(image: .acceptedRequest, color: .green)
        case .suggestion: return NotificationDetail(image: .suggestion, color: .blue)
        case .message: return NotificationDetail(image: .noteMessage, color: .blue)

        }
    }
}


struct NotificationDetail {
    let image: UIImage
    let color: UIColor
}

struct Notification {
    let profileImage: UIImage
    let type: NotificationType
    let username: TempUsernames
    let party: PoliticalParty
    let timeStamp: TempTimeStamp
    let isSupporter: Bool
    
    init(image: UIImage, type: NotificationType, username: TempUsernames, party: PoliticalParty, timeStamp: TempTimeStamp, isSupporter: Bool) {
        self.profileImage = image
        self.type = type
        self.username = username
        self.party = party
        self.timeStamp = timeStamp
        self.isSupporter = isSupporter
    }
}







enum TempTimeStamp: String {
    case one = "1 hr ago"
    case two = "2 hrs ago"
    var value: String { return rawValue }
}

enum TempUsernames: String {
    case name1 = "jim_bob"
    case name2 = "grizzlySumpter"
    case name3 = "hazelhut_orange"
    case name4 = "fanOperaElectric"
    case name5 = "loudandhairy"
    var value: String { return rawValue }
}

