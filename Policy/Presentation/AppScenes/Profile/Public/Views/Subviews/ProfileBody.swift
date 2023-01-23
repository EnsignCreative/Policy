//
//  ProfileBio.swift
//  Policy
//
//  Created by Bradley Ensign on 1/14/23.
//

import UIKit


class ProfileBodyView: UIView {
    
        var data: Any? {
            didSet {
                guard let profile = data as? ProfileInfo else { return }
                profilePosts.items = profile.posts
                print("........................................................................")
                print(profile.posts.count)
                name.text = profile.name
                party.text = profile.party.rawValue
                party.textColor = profile.party.color
                bio.text = profile.bio
                
                segmentControl.selectedSegmentTintColor = profile.party.color
            }
        }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubViews()
        setConstraints()
        backgroundColor = .white
    }

    let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let party: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bio: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor(r: 241, g: 241, b: 241)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor(r: 241, g: 241, b: 241)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.masksToBounds = true
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let buttonView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: [UIImage.person, UIImage.megaphone, UIImage.activity])
        control.selectedSegmentIndex = 0
        control.tintColor = .black
        control.backgroundColor = .white
        control.layer.masksToBounds = true
        control.isUserInteractionEnabled = true
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let profilePosts: BaseCollectionController<ProfileCell, ProfilePostModel> = {
        let verticle = CollectionLayout(scrollDirection: .vertical)
        let collection = BaseCollectionController<ProfileCell, ProfilePostModel>(collectionViewLayout: verticle.layout)
        collection.widthMultiple = 3
        collection.equalWidthAndHeight = true
        collection.setScroll(to: .vertical, showsIndicator: false)
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()




    func setSubViews() {
        addSubview(name)
        addSubview(party)
        addSubview(bio)
        addSubview(buttonView)
        addSubview(followButton)
        addSubview(messageButton)
        addSubview(segmentControl)
        addSubview(profilePosts.view)
    }
    
    func setConstraints() {
        name.topAnchor.constraint(equalTo: topAnchor).isActive = true
        name.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 24).isActive = true
        name.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        party.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        party.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        party.heightAnchor.constraint(equalToConstant: 24).isActive = true
        party.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        bio.topAnchor.constraint(equalTo: party.bottomAnchor, constant: 4).isActive = true
        bio.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bio.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
        
        buttonView.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 12).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
        
        followButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        followButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor).isActive = true
        followButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor).isActive = true
        followButton.rightAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: -1).isActive = true
        
        messageButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        messageButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor).isActive = true
        messageButton.leftAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: 1).isActive = true
        messageButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor).isActive = true
        
        segmentControl.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 24).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentControl.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        profilePosts.view.topAnchor.constraint(equalTo: segmentControl.bottomAnchor).isActive = true
        profilePosts.view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profilePosts.view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        profilePosts.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




