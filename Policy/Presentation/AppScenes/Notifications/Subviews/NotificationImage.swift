//
//  NotificationImage.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit

// Add multiple profile images if need be
class NotificationImage: UIView {
    
    var data: Notification? {
        didSet {
            guard let notification = data else { return }
            profileImage.image = notification.profileImage
            layoutIfNeeded()
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layoutIfNeeded()
    }

    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .black
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private func setSubViews() {
        addSubview(profileImage)
    }

    private func setConstraints() {

        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
