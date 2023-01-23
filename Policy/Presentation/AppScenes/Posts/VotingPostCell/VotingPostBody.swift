//
//  VotingPostBody.swift
//  Policy
//
//  Created by Bradley Ensign on 1/12/23.
//

import UIKit
    
// Needs different Name
class VotingCollectionBody: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    var picture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .black
        image.layer.opacity = 0.7
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let message: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let percentage: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let support: UILabel = {
        let label = UILabel()
        label.text = "Support"
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentageBackground: UIView = {
        let view = UIView()
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(r: 241, g: 241, b: 241)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let votingBackground: UIView = {
        let view = UIView()
        view.layer.opacity = 0.7
        view.backgroundColor = UIColor(r: 241, g: 241, b: 241)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Should probably be index selector
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let centerSpace: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
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
    
    let likeCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dislikeCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private func setSubViews() {
        addSubview(picture)

        addSubview(percentageBackground)
        addSubview(percentage)
        addSubview(support)
        
        addSubview(votingBackground)
        addSubview(centerSpace)
        addSubview(divider)
        addSubview(likeButton)
        addSubview(likeCount)
        addSubview(dislikeButton)
        addSubview(dislikeCount)
        
        addSubview(message)
    }
    
    private func setConstraints() {

        picture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        picture.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    
        percentageBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        percentageBackground.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        percentageBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        percentageBackground.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true

        percentage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        percentage.bottomAnchor.constraint(equalTo: percentageBackground.centerYAnchor).isActive = true
        percentage.centerXAnchor.constraint(equalTo: percentageBackground.centerXAnchor).isActive = true
        percentage.widthAnchor.constraint(equalTo: percentageBackground.widthAnchor).isActive = true
        
        support.topAnchor.constraint(equalTo: percentage.bottomAnchor).isActive = true
        support.bottomAnchor.constraint(equalTo: percentageBackground.bottomAnchor).isActive = true
        support.centerXAnchor.constraint(equalTo: percentageBackground.centerXAnchor).isActive = true
        support.widthAnchor.constraint(equalTo: percentageBackground.widthAnchor).isActive = true
        
        
        votingBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        votingBackground.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        votingBackground.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        votingBackground.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.2/10).isActive = true

        centerSpace.topAnchor.constraint(equalTo: votingBackground.topAnchor).isActive = true
        centerSpace.bottomAnchor.constraint(equalTo: votingBackground.bottomAnchor).isActive = true
        centerSpace.centerXAnchor.constraint(equalTo: votingBackground.centerXAnchor).isActive = true
        centerSpace.widthAnchor.constraint(equalTo: votingBackground.widthAnchor, multiplier: 1/3).isActive = true
        
        divider.topAnchor.constraint(equalTo: votingBackground.topAnchor, constant: 2).isActive = true
        divider.bottomAnchor.constraint(equalTo: votingBackground.bottomAnchor, constant: -2).isActive = true
        divider.centerXAnchor.constraint(equalTo: votingBackground.centerXAnchor).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: votingBackground.topAnchor, constant: 0).isActive = true
        likeButton.rightAnchor.constraint(equalTo: centerSpace.leftAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalTo: votingBackground.heightAnchor, multiplier: 3/4).isActive = true
        likeButton.widthAnchor.constraint(equalTo: votingBackground.heightAnchor, multiplier: 3/4).isActive = true
        
        likeCount.topAnchor.constraint(equalTo: likeButton.bottomAnchor).isActive = true
        likeCount.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor).isActive = true
        likeCount.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        likeCount.widthAnchor.constraint(equalToConstant: 100).isActive = true

        
        dislikeButton.topAnchor.constraint(equalTo: votingBackground.topAnchor, constant: 0).isActive = true
        dislikeButton.leftAnchor.constraint(equalTo: centerSpace.rightAnchor).isActive = true
        dislikeButton.heightAnchor.constraint(equalTo: votingBackground.heightAnchor, multiplier: 3/4).isActive = true
        dislikeButton.widthAnchor.constraint(equalTo: votingBackground.heightAnchor, multiplier: 3/4).isActive = true

        dislikeCount.topAnchor.constraint(equalTo: dislikeButton.bottomAnchor).isActive = true
        dislikeCount.centerXAnchor.constraint(equalTo: dislikeButton.centerXAnchor).isActive = true
        dislikeCount.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        dislikeCount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        message.topAnchor.constraint(equalTo: percentageBackground.bottomAnchor, constant: 4).isActive = true
        message.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
        message.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: votingBackground.topAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


