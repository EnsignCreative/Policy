//
//  HomeViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

// For Voting Posts
//class HomeViewModel: HomeCollectionCellView<TempPost> {
//    override var item: TempPost? {
//        didSet {
//            guard let post = item else { return }
//            header.profilePic.image = post.profilePic
//            header.username.text = post.username.rawValue
//            body.message.text = post.message
//            body.picture.image = post.profilePic
//            body.likeCount.text = String(post.likeCount) + " likes"
//            body.dislikeCount.text = String(post.dislikeCount) + " dislikes"
//
//            //Needs to be attributed to make bold and clickable
//            let caption = post.username.rawValue + post.caption
//            let final = caption.withBoldText(text: post.username.rawValue)
//            footer.caption.attributedText = final
//
//            let percentage = (post.likeCount / post.dislikeCount) * 100
//            body.percentage.text = String(percentage) + " %"
//        }
//    }
//}


// For Prsonal Posts
class HomeViewModel: HomeCollectionCellView<TempPost> {
    override var item: TempPost? {
        didSet {
            guard let post = item else { return }
            header.profilePic.image = post.profilePic
            header.username.text = post.username.rawValue
            self.post.image = post.profilePic
            
            let caption = post.username.rawValue + post.caption
            let final = caption.withBoldText(text: post.username.rawValue)
            footer.caption.attributedText = final
        }
    }
}




struct TempPost {
    let profilePic: UIImage
    let username: TempUsernames
    let timeStamp: TempTimeStamp
    let message: String
    let likeCount: Int
    let dislikeCount: Int
    let caption: String
    
    init(username: TempUsernames, pic: UIImage, timeStamp: TempTimeStamp, likeCount: Int, dislikeCount: Int, caption: String) {
        self.profilePic = pic
        self.username = username
        self.timeStamp = timeStamp
        self.message = "Something is better than Something"
        self.likeCount = likeCount
        self.dislikeCount = dislikeCount
        self.caption = caption
    }
}





extension HomeController {
    func getPosts() -> [TempPost] {
        let caption = " Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah"
        let one = TempPost(username: .name1, pic: .picOne, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one2 = TempPost(username: .name2, pic: .picTwo, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one3 = TempPost(username: .name3, pic: .picThree, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one4 = TempPost(username: .name4, pic: .picFour, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one5 = TempPost(username: .name5, pic: .picFive, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one6 = TempPost(username: .name1, pic: .picOne, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one7 = TempPost(username: .name5, pic: .picTwo, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one8 = TempPost(username: .name4, pic: .picThree, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one9 = TempPost(username: .name3, pic: .picFour, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one10 = TempPost(username: .name2, pic: .picFive, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one11 = TempPost(username: .name1, pic: .picOne, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)
        let one12 = TempPost(username: .name2, pic: .picFive, timeStamp: .two, likeCount: 20, dislikeCount: 10, caption: caption)
        let one13 = TempPost(username: .name1, pic: .picFour, timeStamp: .one, likeCount: 20, dislikeCount: 10, caption: caption)

        return [one, one2, one3, one4, one5, one6, one7, one8, one9, one10, one11, one12, one13]
    }
}
