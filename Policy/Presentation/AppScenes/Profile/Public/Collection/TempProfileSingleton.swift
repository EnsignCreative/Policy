//
//  TempProfileSingleton.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit


final class ProfileSingleton {
    
    static let shared = ProfileSingleton()
    private var manager = ProfileManager()
    

    func getTempPosts(completion: @escaping ([ProfilePostModel]) -> Void) {
        manager.getTempPosts { posts in
            completion(posts)
        }
    }
    
    func getProfileInfo() -> ProfileInfo {
        return manager.getProfileInfo()
    }
}



final class ProfileManager {
    
    var posts = [ProfilePostModel]()
    var votes = [ProfilePostModel]()
    var activity = [ProfilePostModel]()

    
    init() {
        let image1: UIImage = .picOne
        let image2: UIImage = .picTwo
        let image3: UIImage = .picThree
        let image4: UIImage = .picFour
        
        let p1 = ProfilePostModel(postId: "1", imageURL: image1)
        let p2 = ProfilePostModel(postId: "2", imageURL: image2)
        let p3 = ProfilePostModel(postId: "3", imageURL: image3)
        let p4 = ProfilePostModel(postId: "4", imageURL: image4)
        let p5 = ProfilePostModel(postId: "5", imageURL: image1)
        let p6 = ProfilePostModel(postId: "6", imageURL: image2)
        let p7 = ProfilePostModel(postId: "7", imageURL: image3)
        let p8 = ProfilePostModel(postId: "8", imageURL: image4)
        let p9 = ProfilePostModel(postId: "9", imageURL: image1)
        let p10 = ProfilePostModel(postId: "10", imageURL: image2)
        
        votes = [p1, p2, p3, p4, p5]
        activity = [p1, p2, p3, p4, p5, p6]
        posts = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
    }
    
    func getTempPosts(completion: @escaping ([ProfilePostModel]) -> Void) {
        completion(posts)
    }
    
    func getProfileInfo() -> ProfileInfo {
        let profile = ProfileInfo(profileImage: .picFour, username: "bradley32", name: "Bradley Ensign", supporters: 231, supporting: 402, party: .independant, bio: "This is my bio. I created it in the profile view just for testing purposes. It'll work for now.", posts: posts, votes: votes, activity: activity)
        return profile
    }
}



struct ProfilePostModel {
    var postId: String
    var imageURL: UIImage
}

struct ProfileInfo {
    let profileImage: UIImage
    let username: String
    let name: String
    let supporters: Int
    let supporting: Int
    let party: PoliticalParty
    let bio: String
    let posts: [ProfilePostModel]
    let votes: [ProfilePostModel]
    let activity: [ProfilePostModel]
}

enum PoliticalParty: String { // Add more later and have combinations. ex center right
    case democrat = "Democrat"
    case republican = "Republican"
    case independant = "Independent"
    case centerLeft = "Center-Left"
    case centerRight = "Center-Right"
    case batshitCrazy = "Batshit-Crazy"
    case capitalist = "Capitalist"
    case communist = "Communist"
    case socialist = "Socialist"
    case demSocialist = "Democratic Socialist"
    
    var color: UIColor { // These will be rbg and vary in color depth depending on stance
        switch self {
        case .democrat: return .blue
        case .republican: return .red
        case .independant: return .red
        case .centerLeft: return .blue
        case .centerRight: return .red
        case .batshitCrazy: return .systemPink
        case .capitalist: return .green
        case .communist: return .red
        case .socialist: return .red
        case .demSocialist: return .blue
        }
    }
}



