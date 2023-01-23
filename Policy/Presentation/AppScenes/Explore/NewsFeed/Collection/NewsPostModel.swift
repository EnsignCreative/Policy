//
//  NewsPostModel.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//

import UIKit

struct NewsPost: Decodable, Comparable {
    let website: String
    let title: String
    let desc: String
    let date: Date
    let link: String
    
    init(website: String, title: String, desc: String, date: Date, link: String) {
        self.website = website
        self.title = title
        self.desc = desc
        self.date = date
        self.link = link
    }
}

extension NewsPost {
    static func <(lhs: NewsPost, rhs: NewsPost) -> Bool {
        return lhs.date < rhs.date
    }
    
    func compare(to value: NewsPost) -> Bool {
        return self.date < value.date
    }
    
    enum CodingKeys: String, CodingKey {
        case website, title, desc, date, link
    }
}
