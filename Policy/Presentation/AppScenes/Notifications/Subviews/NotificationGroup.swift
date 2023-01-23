//
//  NotificationGroup.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//
import UIKit

class NotificationGroup: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileOne.layer.cornerRadius = profileOne.frame.size.height / 2
        profileTwo.layer.cornerRadius = profileTwo.frame.size.height / 2
        profileOne.layoutIfNeeded()
        profileTwo.layoutIfNeeded()
    }

    var profileOne: UIImageView = {
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
    
    var profileTwo: UIImageView = {
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
        addSubview(profileOne)
        addSubview(profileTwo)
    }

    private func setConstraints() {

        profileOne.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileOne.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileOne.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true
        profileOne.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true

        profileTwo.topAnchor.constraint(equalTo: profileOne.topAnchor).isActive = true
        profileTwo.leftAnchor.constraint(equalTo: profileOne.rightAnchor, constant: 8).isActive = true
        profileTwo.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        profileTwo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
