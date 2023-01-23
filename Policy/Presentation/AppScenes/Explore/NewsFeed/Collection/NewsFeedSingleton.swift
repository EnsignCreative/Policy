//
//  NewsFeedSingleton.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//


import UIKit

final class NewsFeedSingleton {
    
    static let shared = NewsFeedSingleton()
    private var manager = NewsFeedManager()
    

    func getTempNews(completion: @escaping ([NewsPost]) -> Void) {
        manager.getTempNews { news in
            completion(news)
        }
    }
}







final class NewsFeedManager {
    
    var newsFeed = [NewsPost]()
    
    init() {
        let desc = "Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah "
        let date = Date()
        let link = "https://something"
        let website = "Who Cares"
        let title = "Todays News Title"
        
        let one = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one2 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one3 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one4 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one5 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one6 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one7 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one8 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one9 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        let one0 = NewsPost(website: website, title: title, desc: desc, date: date, link: link)
        
        newsFeed = [one, one2, one3, one4, one5, one6, one7, one8, one9, one0]
    }
    
    func getTempNews(completion: @escaping ([NewsPost]) -> Void) {
        completion(newsFeed)
    }
}




