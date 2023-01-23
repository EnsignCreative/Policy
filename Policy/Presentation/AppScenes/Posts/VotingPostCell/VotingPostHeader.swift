//
//  VotingPostHeader.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//

import UIKit

// This design should be rethought
class VotingCollectionHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }

    var profilePic: UIImageView = {
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

    
    let username: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let party: UILabel = {
        let label = UILabel()
        label.text = "Democrat"
        label.textColor = .blue
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(.share, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private func setSubViews() {
        addSubview(profilePic)
        addSubview(moreButton)
        addSubview(username)
        addSubview(party)
    }
    
    private func setConstraints() {

        profilePic.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profilePic.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profilePic.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true
        profilePic.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true

        moreButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        moreButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        moreButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true

        username.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -4).isActive = true
        username.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 8).isActive = true
        username.rightAnchor.constraint(equalTo: moreButton.leftAnchor, constant: -12).isActive = true
        username.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        party.topAnchor.constraint(equalTo: username.bottomAnchor, constant: -2).isActive = true
        party.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 8).isActive = true
        party.rightAnchor.constraint(equalTo: moreButton.leftAnchor, constant: -12).isActive = true
        party.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
