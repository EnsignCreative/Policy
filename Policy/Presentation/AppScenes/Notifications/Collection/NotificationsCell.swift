//
//  NotificationsCell.swift
//  Policy
//
//  Created by Bradley Ensign on 5/30/22.
//

import UIKit

// maybe factory needed
class NotificationsCellView<U>: UICollectionViewCell, CollectionCellView {
    
    var item: U?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }

    var imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var profileImageView: NotificationImage = {
       let view = NotificationImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let username: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let party: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let message: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var supportButton: UIButton = {
        let button = UIButton()
        button.setTitle("Support", for: .normal)
        button.setTitle("Supporting", for: .selected)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.backgroundColor = .systemCyan
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setSubViews() {
        addSubview(profileImageView)
        addSubview(supportButton)
        addSubview(username)
        addSubview(message)
        addSubview(party)
    }
    

    private func groupImage() {
        
    }

    
    
//    commented on, mentioned you, like your, disliked your, supporting you, accepted your request, new suggestion
//    - if not following, show person with plus icon in the right. otherwise show nothing
    
    private func setConstraints() {

        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3.5/5).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 3.5/5).isActive = true

        supportButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        supportButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        supportButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.5/5).isActive = true
        supportButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 4/5).isActive = true

        username.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 4).isActive = true
        username.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        username.rightAnchor.constraint(equalTo: supportButton.leftAnchor, constant: -4).isActive = true
        
        message.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 2).isActive = true
        message.leftAnchor.constraint(equalTo: username.leftAnchor).isActive = true
        message.rightAnchor.constraint(equalTo: supportButton.leftAnchor, constant: -4).isActive = true
    
        party.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 0).isActive = true
        party.leftAnchor.constraint(equalTo: message.leftAnchor).isActive = true
        party.heightAnchor.constraint(equalToConstant: 20).isActive = true
        party.rightAnchor.constraint(equalTo: supportButton.leftAnchor, constant: -8).isActive = true
        
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes:
                                                   UICollectionViewLayoutAttributes) ->
                                                   UICollectionViewLayoutAttributes { return layoutAttributes }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
