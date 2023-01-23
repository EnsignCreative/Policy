//
//  ProfilePostViewModel.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit



class ProfileCell: ImageOnlyCellView<ProfilePostModel> {
    override var item: ProfilePostModel? {
        didSet {
            guard let post = item else { return }
            imageView.image = post.imageURL
        }
    }
}
