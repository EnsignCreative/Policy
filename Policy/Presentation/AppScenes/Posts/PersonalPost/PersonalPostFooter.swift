//
//  PersonalPostFooter.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit

// This design should be rethought
class PersonalPostFooter: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }
    
    var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var dislikeButton: UIButton = {
        let button = UIButton()
        button.setImage(.unheart, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(.comment, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(.share, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let caption: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var commentsButton: UIButton = {
        let button = UIButton()
        button.setImage(.comment, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let seeComments: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "See all comments"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeStamp: UILabel = {
        let label = UILabel()
        label.text = "2 hrs ago"
        label.textColor = .lightGray
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private func setSubViews() {
        addSubview(likeButton)
        addSubview(dislikeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(caption)
        addSubview(commentsButton)
        addSubview(seeComments)
        addSubview(timeStamp)
    }
    
    private func setConstraints() {
        
        likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        likeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 6).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        dislikeButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        dislikeButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 4).isActive = true
        dislikeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dislikeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        commentButton.leftAnchor.constraint(equalTo: dislikeButton.rightAnchor, constant: 4).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 4).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        caption.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 12).isActive = true
        caption.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        caption.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true

        commentsButton.topAnchor.constraint(equalTo: caption.bottomAnchor).isActive = true
        commentsButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 6).isActive = true
        commentsButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        seeComments.centerYAnchor.constraint(equalTo: commentsButton.centerYAnchor).isActive = true
        seeComments.leftAnchor.constraint(equalTo: commentsButton.rightAnchor, constant: 4).isActive = true
        seeComments.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        seeComments.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        timeStamp.topAnchor.constraint(equalTo: seeComments.bottomAnchor, constant: -2).isActive = true
        timeStamp.leftAnchor.constraint(equalTo: seeComments.leftAnchor).isActive = true
        timeStamp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timeStamp.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
